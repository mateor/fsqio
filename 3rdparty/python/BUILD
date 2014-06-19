# Copyright 2012 Foursquare Labs Inc. All Rights Reserved.

########################################################################################
# Trying to add a new library?                                                         #
# https://sites.google.com/a/foursquare.com/foursquare/eng/build/deploying-python-eggs #
########################################################################################


def make_dep(name, version, dependency_name=None):
  """Build a target from a specified dependency tuple.

  name is the target name, specified in other BUILD files.
  version is a hardcoded version string
  dependency_name is used to identify the specific binary to resolve

  Note that unfortunately python_requirement is an addressable target,
  so their names count as target names in this file, and therefore must
  not collide with other target names. See examples below where we
  pass this a name beginning with an underscore, to avoid such conflicts.
  """
  dependency_name = dependency_name or name
  versioned_name = "%s==%s" % (dependency_name, version)
  req = python_requirement(requirement=versioned_name, name=name)
  python_requirement_library(name=name, requirements=[req])
  return ':' + name


make_dep('apache.aurora.client', '0.0.0.FS1')
make_dep('apache.aurora.common', '0.0.0.FS1')
make_dep('apache.aurora.config', '0.0.0.FS1')
make_dep('apache.gen.aurora', '0.0.0.FS1')
make_dep('apache.gen.thermos', '0.0.0.FS1')
make_dep('apache.thermos.common', '0.0.0.FS1')
make_dep('apache.thermos.config', '0.0.0.FS1')
make_dep('apscheduler', '2.1.1', 'APScheduler')
make_dep('boto', '2.29.1')
make_dep('cookies', '1.2.1')
make_dep('dateutil', '2.1', 'python-dateutil')
make_dep('flask', '0.9')
make_dep('fsevents', '0.3', 'MacFSEvents')
make_dep('hive-codegen', '0.10.0')
make_dep('kazoo', '1.3.1')
make_dep('luigi', '2013.08.07.001')
make_dep('lvm', '2.02.99')
make_dep('mako', '0.7.0', 'Mako')
make_dep('markdown', '2.0.3', 'Markdown')
make_dep('matplotlib', '1.2.1')
make_dep('mechanize', '0.2.5')
make_dep('mesos', '0.19.0')
make_dep('mock', '1.0.1')
make_dep('mox', '0.5.3')
make_dep('nose', '1.3.3')
make_dep('numpy', '1.8.1')
make_dep('psycopg2', '2.5.3')
make_dep('py', '1.4.5')
make_dep('pycurl', '7.19.3.1')
make_dep('pyhadoop', '0.1.4')
make_dep('pyinotify', '0.9.4')
make_dep('pymongo', '2.2.1')
make_dep('pymongo26', '2.6.3', 'pymongo')
make_dep('pyopenssl', '0.13', 'pyOpenSSL')
make_dep('pystache', '0.5.3fs')
make_dep('pystachio', '0.7.2')
make_dep('redis', '2.8.0', 'Redis')
make_dep('repoze.lru', '0.6')
make_dep('requests', '2.3.0')
make_dep('requests_futures', '0.9.4')
make_dep('scikit-learn', '0.14.1')
make_dep('scipy', '0.13.3')
make_dep('setuptools', '0.6.21', 'distribute')
make_dep('simplejson', '3.5.2')
make_dep('sqlalchemy', '0.8.2', 'SQLAlchemy')
make_dep('thrift', '0.9.1')
make_dep('thrift-0.9.1.fs1', '0.9.1.fs1', 'thrift')
make_dep('tornado', '3.1')
make_dep('tornado-redis', '2.4.16')
make_dep('toro', '0.5'),
make_dep('twitter.common.app', '0.3.0')
make_dep('twitter.common.collections', '0.3.0')
make_dep('twitter.common.concurrent', '0.3.0')
make_dep('twitter.common.contextutil', '0.3.0')
make_dep('twitter.common.decorators', '0.3.0')
make_dep('twitter.common.dirutil', '0.3.0')
make_dep('twitter.common.exceptions', '0.3.0')
make_dep('twitter.common.lang', '0.3.0')
make_dep('twitter.common.log', '0.3.0')
make_dep('twitter.common.metrics', '0.3.0')
make_dep('twitter.common.options', '0.3.0')
make_dep('twitter.common.process', '0.3.0')
make_dep('twitter.common.python', '0.5.4')
make_dep('twitter.common.quantity', '0.3.0')
make_dep('twitter.common.recordio', '0.3.0')
make_dep('twitter.common.rpc', '0.3.0')
make_dep('twitter.common.string', '0.3.0')
make_dep('twitter.common.util', '0.3.0')
make_dep('unittest2', '0.5.1')
make_dep('wheel', '0.23.0')
make_dep('whoops', '0.2.0')
make_dep('zope-interface', '4.1.1', 'zope.interface')

python_library(
  name = 'twitter.common.zookeeper',
  dependencies = [
    make_dep('_t.c.zookeeper.', '0.3.0', 'twitter.common.zookeeper'),
    make_dep('zc-zookeeper-static', '3.4.4'),
  ]
)

# XXX(pl): This doesn't easy_install
# make_dep('loko-client', '0.2.4')

python_library(
  name = 'pytest',
  dependencies = [
    # ':py',
    make_dep('_pytest', '2.0.2', 'pytest'),
  ]
)

python_requirement_library(
  name = 'futures',
  requirements = [
    python_requirement('futures>=2.1.3'),
  ],
)

python_library(
  name = 'twisted',
  dependencies = [
    ':pyopenssl',
    make_dep('_twisted', '12.3.0', 'Twisted'),
  ]
)

python_library(
  name = 'twitter-common-zookeeper-serverset',
  dependencies = [
    make_dep('twitter.common.zookeeper.serverset', '0.0.0'),
    make_dep('twitter.common.service.thrift', '0.0.0'),
    ':thrift-0.9.1.fs1',
    ':futures', # needed by twitter.common.concurrent, which is pulled in by twitter.common.zookeeper.serverset
  ]
)

