#!/bin/sh
modified_date="xmlstarlet edit --inplace --omit-decl --update '/devicedata/modified' --value \"`date +'%m/%d/%Y %I:%M %p'`\" $INPUT_PATH/driver.xml"
eval $modified_date
cmd="python3 $BASE_PATH/drivers-driverpackager/dp3/driverpackager.py -v $INPUT_PATH $C4Z_PATH" 
eval $cmd
mv -v -u $C4Z_PATH/source.c4z $C4Z_PATH/$DRIVER_NAME