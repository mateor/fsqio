// Copyright 2013 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.rogue.spindle

import com.mongodb.{DBObject, DefaultDBDecoder, WriteConcern}
import io.fsq.rogue.{MongoJavaDriverAdapter, QueryExecutor, QueryOptimizer}
import io.fsq.rogue.MongoHelpers.MongoSelect
import io.fsq.spindle.common.thrift.bson.TBSONObjectProtocol
import io.fsq.spindle.runtime.{UntypedMetaRecord, UntypedRecord}
import java.io.InputStream


class SpindleDatabaseService(val dbCollectionFactory: SpindleDBCollectionFactory) extends QueryExecutor[UntypedMetaRecord, UntypedRecord] {
  override def readSerializer[M <: UntypedMetaRecord, R](meta: M, select: Option[MongoSelect[M, R]]):
      SpindleRogueReadSerializer[M, R] = {
    new SpindleRogueReadSerializer(meta, select)
  }

  override def writeSerializer(record: UntypedRecord): SpindleRogueWriteSerializer = new SpindleRogueWriteSerializer
  override def defaultWriteConcern: WriteConcern = WriteConcern.SAFE

  // allow this to be overriden to subsititute alternative deserialization methods
  def newBsonStreamDecoder(): (UntypedMetaRecord, InputStream) => SpindleDBObject = {
    val decoder = new DefaultDBDecoder()
    val protocolFactory = new TBSONObjectProtocol.ReaderFactory
    val protocol: TBSONObjectProtocol = protocolFactory.getProtocol

    (meta: UntypedMetaRecord, is: InputStream) => {
      val record = meta.createUntypedRawRecord
      protocol.reset()
      val dbo: DBObject = decoder.decode(is, null)
      protocol.setSource(dbo)
      record.read(protocol)
      SpindleMongoDBObject(record, dbo)
    }
  }

  override val adapter: MongoJavaDriverAdapter[UntypedMetaRecord, UntypedRecord] = new MongoJavaDriverAdapter(
    dbCollectionFactory,
    (meta: UntypedMetaRecord) => SpindleDBDecoderFactory(meta, newBsonStreamDecoder())
  )
  override val optimizer = new QueryOptimizer

  override def save[R <: UntypedRecord](record: R, writeConcern: WriteConcern = defaultWriteConcern): R = {
    if (record.meta.annotations.contains("nosave"))
      throw new IllegalArgumentException("Cannot save a %s record".format(record.meta.recordName))
    super.save(record, writeConcern)
  }

  override def insert[R <: UntypedRecord](record: R, writeConcern: WriteConcern = defaultWriteConcern): R = {
    if (record.meta.annotations.contains("nosave"))
      throw new IllegalArgumentException("Cannot insert a %s record".format(record.meta.recordName))
    super.insert(record, writeConcern)
  }
}
