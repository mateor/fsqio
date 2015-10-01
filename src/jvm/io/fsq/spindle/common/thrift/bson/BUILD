# Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

scala_library(
  name = 'bson',
  sources = globs('*.java','*.scala'),
  dependencies = [
    '3rdparty:fscommon-thrift-base',  # (mateo) Force the jar dep as we deprecate com.foursquare.spindle for io.fsq.
    '3rdparty:fscommon-thrift-bson',  # (mateo) Force the jar dep as we deprecate com.foursquare.spindle for io.fsq.
    '3rdparty:fscommon-thrift-json',  # (mateo) Force the jar dep as we deprecate com.foursquare.spindle for io.fsq.
    '3rdparty:mongodb',  # (mateo) Protect from buildgen - it's a java dep.
    '3rdparty:spindle-runtime',  # (mateo) Force the jar dep as we deprecate com.foursquare.spindle for io.fsq.
    '3rdparty:thrift',
    'src/jvm/io/fsq/spindle/common/thrift/base',
    'src/jvm/io/fsq/spindle/common/thrift/json',
  ],
)
