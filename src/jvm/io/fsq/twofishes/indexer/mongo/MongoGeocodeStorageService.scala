// Copyright 2012 Foursquare Labs Inc. All Rights Reserved.
package io.fsq.twofishes.indexer.mongo

import com.mongodb.{Bytes, DuplicateKeyException}
import com.mongodb.casbah.Imports._
import com.novus.salat._
import com.novus.salat.annotations._
import com.novus.salat.dao._
import com.novus.salat.global._
import io.fsq.twofishes.indexer.util.{BoundingBox, DisplayName, GeocodeRecord}
import io.fsq.twofishes.util.StoredFeatureId

class MongoGeocodeStorageService extends GeocodeStorageWriteService {
  def getById(id: StoredFeatureId): Iterator[GeocodeRecord] = {
    val geocodeCursor = MongoGeocodeDAO.find(MongoDBObject("_id" -> id.longId))
    geocodeCursor.option = Bytes.QUERYOPTION_NOTIMEOUT
    geocodeCursor
  }

  def getNameIndexByIdLangAndName(id: StoredFeatureId, lang: String, name: String): Iterator[NameIndex] = {
    val nameCursor = NameIndexDAO.find(MongoDBObject("fid" -> id.longId, "lang" -> lang, "name" -> name))
    nameCursor.option = Bytes.QUERYOPTION_NOTIMEOUT
    nameCursor
  }

  def insert(record: GeocodeRecord) {
    MongoGeocodeDAO.insert(record)
  }

  def insert(records: List[GeocodeRecord]) {
    records.foreach(record => {
      // Geonames data may contain duplicate features (especially postal codes)
      // Silently swallow duplicate key exceptions and move on
      try {
        insert(record)
      } catch {
        case e: DuplicateKeyException => Unit
      }
    })
  }

  def addBoundingBoxToRecord(bbox: BoundingBox, id: StoredFeatureId) {
    MongoGeocodeDAO.update(MongoDBObject("_id" -> id.longId),
      MongoDBObject("$set" -> MongoDBObject("boundingbox" -> grater[BoundingBox].asDBObject(bbox))),
      false, false)
  }

  def addNameToRecord(name: DisplayName, id: StoredFeatureId) {
    MongoGeocodeDAO.update(MongoDBObject("_id" -> id.longId),
      MongoDBObject("$addToSet" -> MongoDBObject("displayNames" -> grater[DisplayName].asDBObject(name))),
      false, false)
  }

  def addNameIndex(name: NameIndex) {
    NameIndexDAO.insert(name)
  }

  def addNameIndexes(names: List[NameIndex]) {
    NameIndexDAO.insert(names)
  }

  def updateFlagsOnNameIndexByIdLangAndName(id: StoredFeatureId, lang: String, name: String, flags: Int) {
    NameIndexDAO.update(MongoDBObject("fid" -> id.longId, "lang" -> lang, "name" -> name),
      MongoDBObject("$set" -> MongoDBObject("flags" -> flags)),
      upsert = false, multi = true)
  }

  def addPolygonToRecord(id: StoredFeatureId, polyId: ObjectId) {
    MongoGeocodeDAO.update(MongoDBObject("_id" -> id.longId),
      MongoDBObject("$set" ->
        MongoDBObject(
          "hasPoly" -> true,
          "polyId" -> polyId
        )
      ),
      false, false)
  }

  def addSlugToRecord(id: StoredFeatureId, slug: String) {
    MongoGeocodeDAO.update(MongoDBObject("_id" -> id.longId),
      MongoDBObject("$set" -> MongoDBObject("slug" -> slug)),
      false, false)
  }

  def setRecordNames(id: StoredFeatureId, names: List[DisplayName]) {
    MongoGeocodeDAO.update(MongoDBObject("_id" -> id.longId),
      MongoDBObject("$set" -> MongoDBObject(
        "displayNames" -> names.map(n => grater[DisplayName].asDBObject(n)))),
      false, false)
  }
}
