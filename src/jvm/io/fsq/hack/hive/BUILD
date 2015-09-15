# Copyright 2015 Foursquare Labs Inc. All Rights Reserved.

scala_library(
  name = 'hive',
  sources = globs('*.scala'),
  dependencies = [
    '3rdparty:hive-exec',
  ],
  provides = artifact(org='io.fsq', name='hack-hive', repo=internal_repo,),
  # TODO(dan): Prevent any source deps.
)
