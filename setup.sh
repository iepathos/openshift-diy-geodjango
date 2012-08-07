#!/bin/bash

CFLAGS="-O2 -s"
CXXFLAGS="-O2 -s"

cd $OPENSHIFT_TMP_DIR

wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2
tar jxf Python-2.7.3.tar.bz2
cd Python-2.7.3

export CFLAGS="-O3 -s"
export CXXFLAGS="-O3 -s"
export OPT="-O3 -s"

./configure --prefix=$OPENSHIFT_RUNTIME_DIR
make
make install

$OPENSHIFT_RUNTIME_DIR/bin/python -V

export CFLAGS=$CFLAGS
export CXXFLAGS=$CXXFLAGS
export OPTS=$CFLAGS

export PATH=$OPENSHIFT_RUNTIME_DIR/bin:$PATH

cd $OPENSHIFT_TMP_DIR
rm -rf ./Python-2.7.3*

wget http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz
tar zxf setuptools-0.6c11.tar.gz
cd setuptools-0.6c11
$OPENSHIFT_RUNTIME_DIR/bin/python setup.py install

cd $OPENSHIFT_TMP_DIR
rm -rf ./setuptools-0.6c11*

wget http://pypi.python.org/packages/source/p/pip/pip-1.1.tar.gz
tar zxf pip-1.1.tar.gz
cd pip-1.1
$OPENSHIFT_RUNTIME_DIR/bin/python setup.py install

cd $OPENSHIFT_TMP_DIR
rm -rf ./pip-1.1*

$OPENSHIFT_RUNTIME_DIR/bin/pip install uwsgi
$OPENSHIFT_RUNTIME_DIR/bin/uwsgi --version

cd $OPENSHIFT_TMP_DIR
wget http://download.osgeo.org/proj/proj-4.8.0.tar.gz
tar xzf proj-4.8.0.tar.gz
cd proj-4.8.0
./configure --prefix=$OPENSHIFT_RUNTIME_DIR
make
make install
cd ..
rm -rf ./proj-4.8.0*


cd $OPENSHIFT_TMP_DIR
wget http://download.osgeo.org/geos/geos-3.3.5.tar.bz2
tar xjf geos-3.3.5.tar.bz2
cd geos-3.3.5
./configure --prefix=$OPENSHIFT_RUNTIME_DIR
make
make install
cd ..
rm -rf ./geos-3.3.5*


cd $OPENSHIFT_TMP_DIR
wget ftp://ftp.remotesensing.org/gdal/gdal-1.9.1.tar.gz
tar zxf gdal-1.9.1.tar.gz
cd gdal-1.9.1
./configure --prefix=$OPENSHIFT_RUNTIME_DIR --disable-static --with-geos=$OPENSHIFT_RUNTIME_DIR/bin/geos-config
make
make install
cd ..
rm -rf ./gdal-1.9.1*

