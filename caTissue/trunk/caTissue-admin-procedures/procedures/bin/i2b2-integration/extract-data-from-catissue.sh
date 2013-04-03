#!/bin/bash
#--------------------------------------------------------------------------------------------------
# Invokes the caTissueParser program to extract ontology enums and PDOs from caTissue.
#
# Prerequisites:
#     The following configuration files must be checked and edited if need be:
#         config/defaults 
#         config/config.properties 
#     The following environment variables must be set
#         CATISSUE_INSTALL_DIRECTORY
#         CATISSUE_ADMIN_PROCS_HOME
#
# BEWARE. The integration user, under whose authority this script executes, seems 
#         to have restricted capability for creating directories and setting permissions.
#
# NOTES.
# (1) The environment variables are set in bin/global/set.sh
#     As this is an automated procedure, this file will need to be 'sourced'
#     from any utility driving this procedure (eg: see bin/global/catissue-to-i2b2.sh
# (2) If need be this procedure will create the working directories.
#
#---------------------------------------------------------------------------------------------------
source $CATISSUE_ADMIN_PROCS_HOME/bin/common/setenv.sh
source $CATISSUE_ADMIN_PROCS_HOME/bin/common/functions.sh

#
# Clean working directories of any old files...
rm ${CATISSUE_SOURCE_PDO}*
rm ${CATISSUE_SOURCE_ENUMS}*

#
# Extract the data from caTissue...
$JAVA_HOME/bin/java \
         -Dlog4j.configuration=file://$CATISSUE_ADMIN_PROCS_HOME/config/log4j.properties \
         -cp $(for i in $CATISSUE_ADMIN_PROCS_HOME/lib/*.jar ; do echo -n $i: ; done). \
         catissue2i2b2plus.caTissueParser \
         -config=$CATISSUE_ADMIN_PROCS_HOME/config/config.properties

exit_if_bad $? "Failed to extract data from caTissue." 
echo "Data extracted from caTissue."

#
# Make the new files readily accessible...
chmod 777 $CATISSUE_SOURCE_PDO/*
chmod 777 $CATISSUE_SOURCE_ENUMS/*
