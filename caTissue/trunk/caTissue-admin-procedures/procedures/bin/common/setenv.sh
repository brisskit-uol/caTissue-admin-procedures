#!/bin/bash
#
# Basic environment variables for Onyx
# 
# Invocation within another sh script should be:
# source $CATISSUE_ADMIN_PROCS_HOME/setenv.sh
#
#-------------------------------------------------------------------
if [ -z $CATISSUE_ADMIN_DEFAULTS_DEFINED ]
then
	export CATISSUE_ADMIN_DEFAULTS_DEFINED=true	
	source $CATISSUE_ADMIN_PROCS_HOME/config/defaults.sh	
fi


