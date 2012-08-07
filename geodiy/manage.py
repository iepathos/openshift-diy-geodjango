#!/usr/bin/env python
import os, sys

if __name__ == "__main__":
    if os.environ.has_key('OPENSHIFT_REPO_DIR'):
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "geodiy_live.settings")
    else:
        os.environ.setdefault("DJANGO_SETTINGS_MODULE", "geodiy_dev.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
