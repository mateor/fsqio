# Copyright 2012 Foursquare Labs Inc. All Rights Reserved.

########################################################################################
# Trying to add a new library?                                                         #
# https://sites.google.com/a/foursquare.com/foursquare/eng/build/deploying-python-eggs #
########################################################################################


def make_lib(name, dependency_name=None):
  dependency_name = dependency_name or name
  python_library(
    name=name,
    dependencies=[python_requirement(dependency_name)]
  )

make_lib('antlr-3.1.3', 'antlr_python_runtime==3.1.3')
make_lib('argparse', 'argparse==1.2.1')
make_lib('boto', 'boto==2.6.0_fsa')
make_lib('cherrypy', 'CherryPy==3.2.2')
make_lib('cookies', 'cookies==1.2.1')
make_lib('counter', 'Counter==1.0.0')
make_lib('dateutil', 'python-dateutil==2.1')
make_lib('flask', 'Flask==0.9')
make_lib('kazoo', 'kazoo==1.1')
make_lib('luigi', 'luigi==2013_08_07.001')
make_lib('mako', 'Mako==0.7.0')
make_lib('markdown', 'Markdown==2.0.3')
make_lib('mechanize', 'mechanize==0.2.5')
make_lib('redis', 'Redis==2.8.0')

python_library(
  name = 'hive',
  dependencies = [
    ':thrift-0.9-fs1',
    python_requirement('hive==0.9.0_cdh4.1.2_nothrift'),
  ]
)

python_library(
  name = 'mesos',
  dependencies = [
    ':protobuf',
    python_requirement('mesos==0.11.0'),
  ]
)

make_lib('mock', 'mock==1.0.1')
make_lib('mox', 'mox==0.5.3')
make_lib('mako', 'Mako==0.7.0')
make_lib('ordereddict', 'ordereddict==1.1')
make_lib('protobuf', 'protobuf==2.5.0')
make_lib('psycopg2', 'psycopg2==2.5.2')
make_lib('py', 'py==1.4.5')
make_lib('pymongo', 'pymongo==2.2.1')
make_lib('pymongo26', 'pymongo==2.6.3')
make_lib('pyopenssl', 'pyOpenSSL==0.13')
make_lib('pystache', 'pystache==0.5.3fs')
make_lib('pyhadoop', 'pyhadoop==0.1.4')
make_lib('zope-interface', 'zope.interface==4.0.5')
make_lib('lvm', 'lvm==2.02.99_2_git._2012_10_22_')
make_lib('pycurl', 'pycurl==7.19.0')
make_lib('apscheduler', 'APScheduler==2.1.1')
make_lib('loko_tools', 'loko_tools==0.1.1')

python_library(
  name = 'pytest',
  dependencies = [
    ':py',
    python_requirement('pytest==2.0.2'),
  ]
)

make_lib('requests', 'requests==0.14.2')
make_lib('requests-1.2', 'requests==1.2.0')
make_lib('setuptools', 'distribute==0.6.21')
make_lib('sqlalchemy', 'SQLAlchemy==0.8.2')
make_lib('thrift-0.7', 'Thrift==0.7.0_dev')
make_lib('thrift-0.9-fs1', 'thrift==0.9.0_fs1')
make_lib('tornado', 'tornado==3.1')
make_lib('toro', 'toro==0.5')
make_lib('futures', 'concurrent.futures==2.1.3')

python_library(
  name = 'twisted',
  dependencies = [
    ':pyopenssl',
    python_requirement('Twisted==12.3.0'),
  ]
)

make_lib('unittest2', 'unittest2==0.5.1')
make_lib('whoops', 'whoops==0.2.0')

make_lib('numpy', 'numpy==1.7.1')
python_library(
  name = 'matplotlib',
  dependencies = [
    ':numpy',
    python_requirement('matplotlib==1.2.1')
  ]
)
make_lib('fsevents', 'MacFSEvents==0.2.8')
make_lib('pyinotify', 'pyinotify==0.9.4')
make_lib('scipy', 'scipy==0.12.0')
make_lib('scikit-learn', 'scikit-learn==0.13.1')
make_lib('simplejson', 'simplejson==3.3.0')
python_library(
  name = 'twitter-common-zookeeper-serverset',
  dependencies = [
    python_requirement('twitter.common.zookeeper.serverset==0.0.0'),
    python_requirement('twitter.common.service.thrift==0.0.0'),
    ':thrift-0.9-fs1',
    ':futures', # needed by twitter.common.concurrent, which is pulled in by twitter.common.zookeeper.serverset
  ]
)
