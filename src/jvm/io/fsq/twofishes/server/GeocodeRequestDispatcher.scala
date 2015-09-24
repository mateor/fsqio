//  Copyright 2012 Foursquare Labs Inc. All Rights Reserved
package io.fsq.twofishes.server

import com.twitter.ostrich.stats.Stats
import io.fsq.twofishes.gen.{GeocodeRequest, GeocodeResponse, ResponseIncludes}
import io.fsq.twofishes.util.Identity._
import io.fsq.twofishes.util.Lists.Implicits._
import scalaj.collection.Implicits._

/*
 This class is responsible for taking in a GeocodeRequest, which can either be a geocode, a slug lookup,
 or an autocomplete request, and handing it off to the appropriate logic loop.
 */

class GeocodeRequestDispatcher(
  store: GeocodeStorageReadService) {

  def geocode(req: GeocodeRequest): GeocodeResponse = {
    val logger = new MemoryLogger(req)
    Stats.incr("geocode-requests", 1)
    val finalReq = req.mutable

    finalReq.responseIncludes_=(ResponseIncludes.DISPLAY_NAME :: req.responseIncludes.toList)

    if (req.slugOption.exists(_.nonEmpty)) {
      new SlugGeocoderImpl(store, finalReq, logger).doGeocode()
    } else if (req.autocomplete) {
      new AutocompleteGeocoderImpl(store, finalReq, logger).doGeocode()
    } else {
      new GeocoderImpl(store, finalReq, logger).doGeocode()
    }
  }
}
