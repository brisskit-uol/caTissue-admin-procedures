#!/bin/bash
#--------------------------------------------------------------------
# Default settings used by scripts within the bin directory
# 
#--------------------------------------------------------------------

export CATISSUE_SOURCE_PDO=
export CATISSUE_SOURCE_ENUMS=

export I2B2_HOSTNAME=i2b2
export I2B2_DESTINATION_PDO=/var/local/brisskit/i2b2/i2b2-admin-procedures/remote-holding-area/catissue/pdo
export I2B2_DESTINATION_ENUMS=/var/local/brisskit/i2b2/i2b2-admin-procedures/remote-holding-area/catissue/ontology-enums

#---------------------------------------------------------------------------------
# Java home directory
#---------------------------------------------------------------------------------
export JAVA_HOME=$CATISSUE_INSTALL_DIRECTORY/java/jdk1.7.0_17
