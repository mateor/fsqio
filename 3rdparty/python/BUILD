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
  return python_requirement(requirement=versioned_name, name=name)


make_dep('antlr-3.1.3', '3.1.3', 'antlr_python_runtime')
make_dep('argparse', '1.2.1')
make_dep('boto', '2.6.0_fsa')
make_dep('cherrypy', '3.2.2', 'CherryPy')
make_dep('cookies', '1.2.1')
make_dep('counter', '1.0.0', 'Counter')
make_dep('dateutil', '2.1', 'python-dateutil')
make_dep('flask', '0.9', 'Flask')
make_dep('kazoo', '1.1')
make_dep('luigi', '2013_08_07.001')
make_dep('mako', '0.7.0', 'Mako')
make_dep('markdown', '2.0.3', 'Markdown')
make_dep('mechanize', '0.2.5')
make_dep('redis', '2.8.0', 'Redis')

python_library(
  name = 'hive',
  dependencies = [
    ':thrift-0.9-fs1',
    make_dep('_hive', '0.9.0_cdh4.1.2_nothrift', 'hive'),
  ]
)

python_library(
  name = 'mesos',
  dependencies = [
    ':protobuf',
    make_dep('_mesos', '0.11.0', 'mesos'),
  ]
)

make_dep('mock', '1.0.1')
make_dep('mox', '0.5.3')
make_dep('ordereddict', '1.1')
make_dep('protobuf', '2.5.0')
make_dep('psycopg2', '2.5.2')
make_dep('py', '1.4.5')
make_dep('pymongo', '2.2.1')
make_dep('pymongo26', '2.6.3', 'pymongo')
make_dep('pyopenssl', '0.13', 'pyOpenSSL')
make_dep('pystache', '0.5.3fs')
make_dep('pyhadoop', '0.1.4')
make_dep('zope-interface', '4.0.5', 'zope.interface')
make_dep('lvm', '2.02.99_2_git._2012_10_22_')
make_dep('pycurl', '7.19.0')
make_dep('apscheduler', '2.1.1', 'APScheduler')
make_dep('loko_tools', '0.1.1')

python_library(
  name = 'pytest',
  dependencies = [
    ':py',
    make_dep('_pytest', '2.0.2', 'pytest'),
  ]
)

make_dep('requests', '0.14.2')
make_dep('requests-1.2', '1.2.0', 'requests')
make_dep('setuptools', '0.6.21', 'distribute')
make_dep('sqlalchemy', '0.8.2', 'SQLAlchemy')
make_dep('thrift-0.7', '0.7.0_dev', 'Thrift')
make_dep('thrift-0.9-fs1', '0.9.0_fs1', 'thrift')
make_dep('tornado', '3.1')
make_dep('toro', '0.5')
make_dep('futures', '2.1.3', 'concurrent.futures')

python_library(
  name = 'twisted',
  dependencies = [
    ':pyopenssl',
    make_dep('_twisted', '12.3.0', 'Twisted'),
  ]
)

make_dep('unittest2', '0.5.1')
make_dep('whoops', '0.2.0')

make_dep('numpy', '1.7.1')
python_library(
  name = 'matplotlib',
  dependencies = [
    ':numpy',
    make_dep('_matplotlib', '1.2.1', 'matplotlib'),
  ]
)
make_dep('fsevents', '0.2.8', 'MacFSEvents')
make_dep('pyinotify', '0.9.4')
make_dep('scipy', '0.12.0')
make_dep('scikit-learn', '0.13.1')
make_dep('simplejson', '3.3.0')
python_library(
  name = 'twitter-common-zookeeper-serverset',
  dependencies = [
    make_dep('twitter.common.zookeeper.serverset', '0.0.0'),
    make_dep('twitter.common.service.thrift', '0.0.0'),
    ':thrift-0.9-fs1',
    ':futures', # needed by twitter.common.concurrent, which is pulled in by twitter.common.zookeeper.serverset
  ]
)
