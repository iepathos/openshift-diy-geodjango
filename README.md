openshift-diy-geodjango
=======================

Template project for building and running GeoDjango (Django + spatial functionality) on OpenShift.
This templates is created to ease setting up an OpenShift environment for GeoDjango projects.
Main requirements are PostgreSQL cartridge installed (PostGIS comes with it)

Deployment:

1. Install PostgreSQL cartridge
2. Setup Django project settings (geodiy_live for OpenShift)
3. commit-n-push
4. Run $OPENSHIFT_REPO_DIR/.openshift/bootstrap.sh to build an environment (this will install Python 2.7, pip, uwsgi, proj4, geos, gdal, create PostGIS template database, create project database inherited from template database, create database roles)

After these steps you will get:
* Python 2.7
* pip
* uwsgi
* proj4
* geos
* gdal
* PostGIS-enabled template database
* PostgreSQL database (inherited from template db) for Django project
* Ready to go Django project 
* activated action_hooks

The easiest way to start your app is to commit-n-push something into your openshift repo again (hooks will do their job).
