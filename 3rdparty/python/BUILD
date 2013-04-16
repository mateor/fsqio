# Copyright 2012 Foursquare Labs Inc. All Rights Reserved.

from foursquare.pants.python_egg_download import CachedPythonEgg, PlatformDependentEgg

egg = CachedPythonEgg

python_library(
  name = 'antlr-3.1.3',
  dependencies = [egg("antlr_python_runtime-3.1.3-py2.6.egg")])

python_library(
  name = 'argparse',
  dependencies = [egg("argparse-1.2.1-py2.6.egg")])

python_library(
  name = 'boto',
  dependencies = [egg("boto-2.6.0-py2.6.egg")])

python_library(
  name = 'cherrypy',
  dependencies = [egg("CherryPy-3.2.2-py2.6.egg")])

python_library(
  name = 'dateutil',
  dependencies = [egg("python_dateutil-2.1-py2.6.egg")])

python_library(
  name = 'flask',
  dependencies = [egg("Flask-0.9-py2.6.egg")])

python_library(
  name = 'kazoo',
  dependencies = [egg("kazoo-0.9-py2.6.egg")])

python_library(
  name = 'luigi',
  dependencies = [egg("luigi-2013_04_16.001-py2.6.egg")])

python_library(
  name = 'mako',
  dependencies = [egg("Mako-0.7.0-py2.6.egg")])

python_library(
  name = 'markdown',
  dependencies = [egg("Markdown-2.0.3-py2.6.egg")])

python_library(
  name = 'mox',
  dependencies = [egg("mox-0.5.3-py2.6.egg")])

python_library(
  name = 'psycopg2',
  dependencies = [PlatformDependentEgg(
      linux="psycopg2_vertica-2.4.6-py2.6-linux-x86_64.egg",
      osx="psycopg2_vertica-2.4.6-py2.6-macosx-10.7-intel.egg"
      )])

python_library(
  name = 'py',
  dependencies = [egg("py-1.4.5-py2.6.egg")])

python_library(
  name = 'pymongo',
  dependencies = [egg("pymongo-2.2.1-py2.6-linux-x86_64.egg")])

python_library(
  name = 'pyopenssl',
  dependencies = [egg("pyOpenSSL-0.13-py2.6-linux-x86_64.egg")])

python_library(
  name = 'pystache',
  dependencies = [egg('pystache-0.5.3-py2.6.egg')])

python_library(
  name = 'pytest',
  dependencies = [
    ':py',
    egg("pytest-2.0.2-py2.6.egg"),
  ]
)

python_library(
  name = 'requests',
  dependencies = [egg("requests-0.14.2-py2.6.egg")])

python_library(
  name = 'requests-1.2',
  dependencies = [egg("requests-1.2.0-py2.6.egg")])

python_library(
  name = 'setuptools',
  dependencies = [egg("distribute-0.6.21-py2.6.egg")])

python_library(
  name = 'thrift-0.7',
  dependencies = [egg("Thrift-0.7.0_dev-py2.6.egg")])

python_library(
  name = 'twisted',
  dependencies = [egg("Twisted-12.3.0-py2.6-linux-x86_64.egg"), ':pyopenssl'])
