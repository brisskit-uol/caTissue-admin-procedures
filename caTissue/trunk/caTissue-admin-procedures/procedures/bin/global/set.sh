#!/bin/bash
#-----------------------------------------------------------------------------------------------------------
# Source this at the start of any shell session, or from a script.
# (There should be no need to do this as sudo or root)
# Use "source ./set.sh" or ". ./set.sh" at the command line or within a composition script.
# Remember, if you execute any script as sudo, then you must inherit the environment variables; eg:
# > sudo -E ./install-catissue.sh 
#
# NOTES.
# (1) Edit setting for CATISSUE_ADMIN_PROCS_HOME.
# (2) Edit setting for local ADMIN_PACKAGE_NAME in order to pick up the correct version of the procedures.
#-----------------------------------------------------------------------------------------------------------
export CATISSUE_INSTALL_DIRECTORY=/var/local/brisskit/catissue
ADMIN_PACKAGE_NAME=catissue-admin-procedures
export CATISSUE_ADMIN_PROCS_HOME=$CATISSUE_INSTALL_DIRECTORY/${ADMIN_PACKAGE_NAME}