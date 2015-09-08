# Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

scala_library(
  name = 'bson',
  sources = globs('*.java', '*.scala'),
  dependencies = [
    '3rdparty:mongodb',  # (mateo) Protect from buildgen - it's a java dep.
    'src/jvm/io/fsq/common/thrift/base',
  ],
)
