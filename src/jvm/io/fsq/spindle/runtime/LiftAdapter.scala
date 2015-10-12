// Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.spindle.runtime

// TODO(dan): Type this with a typesafe id, so we can't accidentally mix it into
// the wrong thing.
trait LiftAdapter {
  def valueFromWireName(name: String): Option[Any]
  def primedObjFromWireName(name: String): Option[AnyRef]
  def primedObjSeqFromWireName(name: String): Seq[AnyRef]
}
