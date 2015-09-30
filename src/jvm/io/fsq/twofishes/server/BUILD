# Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

scala_library(
  name = 'server',
  sources = globs('*.scala'),
  dependencies = [
    '3rdparty:country-revgeo',
    '3rdparty:finagle',
    '3rdparty:fscommon-thrift-json',
    '3rdparty:gt-geojson',
    '3rdparty:hadoop-common',
    '3rdparty:hbase',  # TODO(dan): This is only here while we transition twofishes to our hfile reader.
    '3rdparty:jts',
    '3rdparty:mongodb',
    '3rdparty:netty',
    '3rdparty:ostrich',
    '3rdparty:s2',
    '3rdparty:scalaj-collection',
    '3rdparty:scopt',
    '3rdparty:slf4s',
    '3rdparty:spindle-runtime',
    '3rdparty:thrift',
    '3rdparty:twitter-json',
    '3rdparty:twitter-util',
    'src/jvm/io/fsq/twofishes/core',
    'src/jvm/io/fsq/twofishes/country',
    'src/jvm/io/fsq/twofishes/hacks',
    'src/jvm/io/fsq/twofishes/server/resources/static',  # Runtime dep.
    'src/jvm/io/fsq/twofishes/server/resources/warmup',  # Runtime dep.
    'src/jvm/io/fsq/twofishes/util',
    'src/thrift/io/fsq/twofishes',
  ],
)
