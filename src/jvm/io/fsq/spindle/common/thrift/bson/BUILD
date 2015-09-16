# Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

java_library(
  name = 'bson',
  sources = globs('*.java'),
  dependencies = [
    '3rdparty:mongodb',  # (mateo) Protect from buildgen - it's a java dep.
    'src/jvm/io/fsq/spindle/common/thrift/base',
  ],
)
