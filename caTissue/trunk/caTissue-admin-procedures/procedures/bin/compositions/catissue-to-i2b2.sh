#!/bin/bash
#--------------------------------------------------------------------------------------------------
# Driving script for regular extraction of data from catissue and transport into i2b2.
#
# Prerequisites:
#     The relevant ssh keys must have been copied across.
#     The following configuration file must be checked and edited if need be:
#         config/defaults 
#         config/config.properties 
#     The following environment variables must be set
#         CATISSUE_INSTALL_DIRECTORY
#         CATISSUE_ADMIN_PROCS_HOME
#
# NOTES.
# (1) The environment variables are set in bin/global/set.sh
#     As this is an automated procedure, this file will need to be 'sourced'
#     from any utility driving this procedure (eg: see bin/global/catissue-to-i2b2.sh
# (2) This will delete the files on i2b2 if they dont exist on catissue anymore
#
#---------------------------------------------------------------------------------------------------
source /var/local/brisskit/catissue/catissue-admin-procedures/bin/global/set.sh
source $CATISSUE_ADMIN_PROCS_HOME/bin/common/setenv.sh
source $CATISSUE_ADMIN_PROCS_HOME/bin/common/functions.sh

#
# Extract the data from caTissue...
$CATISSUE_ADMIN_PROCS_HOME/bin/i2b2-integration/extract-data-from-catissue.sh

#
# Push the extracted data into i2b2 VM...
$CATISSUE_ADMIN_PROCS_HOME/bin/i2b2-integration/push-extracted-data-to-i2b2.sh
