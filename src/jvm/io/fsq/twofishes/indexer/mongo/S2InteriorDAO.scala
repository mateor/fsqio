// Copyright 2015 Foursquare Labs Inc. All Rights Reserved.
package io.fsq.twofishes.indexer.mongo

import com.mongodb.casbah.Imports._
import com.novus.salat._
import com.novus.salat.annotations._
import com.novus.salat.dao._
import com.novus.salat.global._

case class S2InteriorIndex(
  @Key("_id") _id: ObjectId,
  cellIds: List[Long]
)

object S2InteriorIndexDAO extends SalatDAO[S2InteriorIndex, String](
  collection = MongoIndexerConnection()("geocoder")("s2_interior_index")) {
  def makeIndexes() {}
}

