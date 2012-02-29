#! /bin/sh

cd $1

# the usual ...
echo "lein clean"
lein clean

echo "lein deps"
lein deps

echo "lein uberjar"
lein uberjar

# move jar file to job tracker
echo "Copying uberjar to $2"
scp -i $2 $1/forma-0.2.0-SNAPSHOT-standalone.jar hadoop@$3:

echo "Logging into $2"
# launch a new screen with logging enabled
ssh -i $2 hadoop@$3


