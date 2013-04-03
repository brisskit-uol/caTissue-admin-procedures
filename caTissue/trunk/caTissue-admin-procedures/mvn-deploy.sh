#!/bin/bash
#-----------------------------------------------------------------------------------------------
# Please consult the project's README for further details.
#
# This script:
# (1) Invokes maven to do a (production) deploy to the Brisskit maven repository.
# (2) Sets up the lib directory suitable for testing.
#
# Please try NOT to commit lib artifacts to SVN once they have been set up.
#
# Author: Jeff Lusted (jl99@leicester.ac.uk)
#-----------------------------------------------------------------------------------------------

#===========================================================================
# Clean up the lib
#===========================================================================
rm ./procedures/lib/* >/dev/null 2>/dev/null

#===========================================================================
# Do the first phase local install (production version) ...
#===========================================================================
mvn clean deploy

#===========================================================================
# Setup the lib directory suitable for testing ...
#===========================================================================
cd ./target
unzip ./catissue-admin-procedures*.zip >/dev/null 2>/dev/null
rm ./catissue-admin-procedures*.zip
cp ./catissue-admin-procedures*/lib/* ../procedures/lib
rm -Rf ./catissue-admin-procedures*
cd ..

echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "===>Remote development deploy completed."
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
