// Copyright 2012 Foursquare Labs Inc. All Rights Reserved.

package io.fsq.twofishes.util

import io.fsq.twofishes.gen.{GeocodeFeature, GeocodeInterpretation, YahooWoeType}
import io.fsq.twofishes.util.Identity._
import io.fsq.twofishes.util.Lists.Implicits._


object GeocodeFeatureUtils {

  def findFeaturesByWoeType(
    interpretation: GeocodeInterpretation,
    woeType: YahooWoeType
  ): Iterable[GeocodeFeature] = {
    (if (interpretation.feature.woeTypeOption.has(woeType)) Some(interpretation.feature) else None) ++
      interpretation.parents.filter(_.woeTypeOption.has(woeType))
  }

  def findFeaturesByWoeType(
    interpretations: Iterable[GeocodeInterpretation],
    woeType: YahooWoeType
  ): Iterable[GeocodeFeature] = {
    interpretations.flatMap(findFeaturesByWoeType(_, woeType))
  }

  def getStateLikeFeature(interpretation: GeocodeInterpretation): Option[GeocodeFeature] = {
    val cc = interpretation.feature.ccOption.getOrElse("XX")
    // long discussion from greek SU wanted this formatting
    if (cc =? "GR") {
      val department = GeocodeFeatureUtils.findFeaturesByWoeType(interpretation, YahooWoeType.ADMIN2).headOption
      if (department.exists(f => GeoIdConstants.atticaDepartments.exists(_.longId == f.longId))) {
        GeocodeFeatureUtils.findFeaturesByWoeType(interpretation, YahooWoeType.ADMIN1).headOption
      } else {
        department
      }
    } else if (NameUtils.countryUsesCountyAsState(cc)) {
      GeocodeFeatureUtils.findFeaturesByWoeType(interpretation, YahooWoeType.ADMIN2).headOption
    } else {
      GeocodeFeatureUtils.findFeaturesByWoeType(interpretation, YahooWoeType.ADMIN1).headOption
    }
  }
}
