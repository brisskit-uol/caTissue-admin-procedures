#!/bin/bash
#--------------------------------------------------------------------------------------------------
# Copy the extracted pdos and enums from the catissue VM to the i2b2 VM.
#
# Prerequisites:
#     The relevant ssh keys must have been copied across.
#     The following configuration file must be checked and edited if need be:
#         config/defaults 
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
source $CATISSUE_ADMIN_PROCS_HOME/bin/common/setenv.sh
source $CATISSUE_ADMIN_PROCS_HOME/bin/common/functions.sh

#
# Copy the pdos
rsync -avz --omit-dir-times --delete ${CATISSUE_SOURCE_PDO} ${I2B2_HOSTNAME}:${I2B2_DESTINATION_PDO}

#
# Copy the enums
rsync -avz --omit-dir-times --delete ${CATISSUE_SOURCE_ENUMS} ${I2B2_HOSTNAME}:${I2B2_DESTINATION_ENUMS}

