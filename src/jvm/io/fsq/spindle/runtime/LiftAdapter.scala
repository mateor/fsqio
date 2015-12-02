// Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.spindle.runtime

trait LiftAdapter[Id] {
  def valueFromWireName(name: String): Option[Any]
  def primedObjFromWireName(name: String): Option[AnyRef]
  def primedObjSeqFromWireName(name: String): Seq[AnyRef]
}
