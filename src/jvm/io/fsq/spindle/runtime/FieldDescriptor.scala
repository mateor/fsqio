// Copyright 2012 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.spindle.runtime

import io.fsq.field.{Field, OptionalField}

sealed trait UntypedFieldDescriptor {
  def id: Int
  def name: String
  def longName: String
  def annotations: Map[String, String]
  def unsafeGetterOption(record: Any): Option[Any]
  def unsafeSetterRaw(record: Any, value: Any): Unit
  def unsafeUnsetterRaw(record: Any): Unit
  def unsafeManifest: Manifest[_]
}

trait FieldDescriptor[F, R <: Record[R], M <: MetaRecord[R, M]] extends Field[F, M] with UntypedFieldDescriptor {
  def getter(record: R): Option[F]
  def getterOption(record: R): Option[F] = getter(record)
  def manifest: Manifest[F]
  def setterRaw(record: MutableRecord[R], value: F): Unit
  def unsetterRaw(record: MutableRecord[R]): Unit

  override def unsafeGetterOption(record: Any): Option[Any] = getterOption(record.asInstanceOf[R])
  override def unsafeSetterRaw(record: Any, value: Any): Unit = {
    setterRaw(record.asInstanceOf[MutableRecord[R]], value.asInstanceOf[F])
  }
  override def unsafeUnsetterRaw(record: Any): Unit = unsetterRaw(record.asInstanceOf[MutableRecord[R]])
  override def unsafeManifest: Manifest[_] = manifest
}

trait UntypedForeignKeyField {
  def unsafeObjGetter: Any => Option[Any]
}

trait ForeignKeyField[F, R <: Record[R]] extends UntypedForeignKeyField {
  def objSetter: (R, SemitypedHasPrimaryKey[F]) => Unit
  def objGetter: (R, UntypedMetaRecord) => Option[UntypedRecord with SemitypedHasPrimaryKey[F]]
  def alternateObjSetter: (R, AnyRef) => Unit
  def alternateObjGetter: R => Option[AnyRef]
}

trait UntypedForeignKeySeqField {
  def unsafeObjGetter: Any => Seq[Any]
}

trait ForeignKeySeqField[F, R <: Record[R]] extends UntypedForeignKeySeqField {
  def objSetter: (R, Seq[SemitypedHasPrimaryKey[F]]) => Unit
  def objGetter: (R, UntypedMetaRecord) => Seq[UntypedRecord with SemitypedHasPrimaryKey[F]]
  def alternateObjSetter: (R, Seq[AnyRef]) => Unit
  def alternateObjGetter: R => Seq[AnyRef]
}

trait UntypedBitfieldField {
  def unsafeStructMeta: MetaRecord[_, _]
}

trait BitfieldField[FR <: Record[FR], FM <: MetaRecord[FR, FM]] extends UntypedBitfieldField {
  def structMeta: FM
  override def unsafeStructMeta: MetaRecord[_, _] = structMeta
}

trait UntypedStructField {
  def unsafeStructMeta: MetaRecord[_, _]
}

trait StructField[ER <: Record[ER], EM <: MetaRecord[ER, EM]] extends UntypedStructField {
  def structMeta: EM
  override def unsafeStructMeta: MetaRecord[_, _] = structMeta
}

trait EnumField {
  def enumMeta: EnumMeta[_]
}

abstract class OptionalFieldDescriptor[F, R <: Record[R], M <: MetaRecord[R, M]](
    override val name: String,
    override val longName: String,
    override val id: Int,
    override val annotations: Map[String, String],
    override val owner: M,
    override val manifest: Manifest[F]
) extends OptionalField[F, M] with FieldDescriptor[F, R, M]

abstract class ForeignKeyFieldDescriptor[F, R <: Record[R], M <: MetaRecord[R, M]](
    override val name: String,
    override val longName: String,
    override val id: Int,
    override val annotations: Map[String, String],
    override val owner: M,
    override val objSetter: (R, SemitypedHasPrimaryKey[F]) => Unit,
    override val objGetter: (R, UntypedMetaRecord) => Option[UntypedRecord with SemitypedHasPrimaryKey[F]],
    override val unsafeObjGetter: Any => Option[Any],
    override val alternateObjSetter: (R, AnyRef) => Unit,
    override val alternateObjGetter: R => Option[AnyRef],
    override val manifest: Manifest[F]
) extends OptionalField[F, M] with FieldDescriptor[F, R, M] with ForeignKeyField[F, R]

abstract class ForeignKeySeqFieldDescriptor[F, R <: Record[R], M <: MetaRecord[R, M]](
    override val name: String,
    override val longName: String,
    override val id: Int,
    override val annotations: Map[String, String],
    override val owner: M,
    override val objSetter: (R, Seq[SemitypedHasPrimaryKey[F]]) => Unit,
    override val objGetter: (R, UntypedMetaRecord) => Seq[UntypedRecord with SemitypedHasPrimaryKey[F]],
    override val unsafeObjGetter: Any => Seq[Any],
    override val alternateObjSetter: (R, Seq[AnyRef]) => Unit,
    override val alternateObjGetter: R => Seq[AnyRef],
    override val manifest: Manifest[Seq[F]]
) extends OptionalField[Seq[F], M] with FieldDescriptor[Seq[F], R, M] with ForeignKeySeqField[F, R]

abstract class BitfieldFieldDescriptor[F, R <: Record[R], M <: MetaRecord[R, M], FR <: Record[FR], FM <: MetaRecord[FR, FM]](
    override val name: String,
    override val longName: String,
    override val id: Int,
    override val annotations: Map[String, String],
    override val owner: M,
    override val structMeta: FM,
    override val manifest: Manifest[F]
) extends OptionalField[F, M] with FieldDescriptor[F, R, M] with BitfieldField[FR, FM]

abstract class StructFieldDescriptor[R <: Record[R], M <: MetaRecord[R, M], ER <: Record[ER], EM <: MetaRecord[ER, EM]](
    override val name: String,
    override val longName: String,
    override val id: Int,
    override val annotations: Map[String, String],
    override val owner: M,
    override val structMeta: EM,
    override val manifest: Manifest[ER]
) extends OptionalField[ER, M] with FieldDescriptor[ER, R, M] with StructField[ER, EM]

abstract class ExceptionFieldDescriptor[R <: Record[R], M <: MetaRecord[R, M], ER <: Record[ER], EM <: MetaRecord[ER, EM], E <: RuntimeException with ER](
    override val name: String,
    override val longName: String,
    override val id: Int,
    override val annotations: Map[String, String],
    override val owner: M,
    override val structMeta: EM,
    override val manifest: Manifest[E]
) extends OptionalField[E, M] with FieldDescriptor[E, R, M] with StructField[ER, EM]
