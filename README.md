openshift-diy-geodjango
=======================

Template project for building and running GeoDjango (Django + spatial functionality) on OpenShift.
This templates is created to ease setting up an OpenShift environment for GeoDjango projects.
Main requirements are PostgreSQL cartridge installed (PostGIS comes with it)

Deployment:

1. Install PostgreSQL cartridge
2. Run ./setup.sh to build and install Python 2.7, pip, uwsgi, proj4, geos, gdal
3. Setup Django project settings (geodiy_live for OpenShift)
4. commit-n-push (.openshift/* scripts will do pip requirements installation and uwsgi restart).
