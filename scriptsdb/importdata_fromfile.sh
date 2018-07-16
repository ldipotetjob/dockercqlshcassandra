#!/bin/bash
# https://lug.fh-swf.de/vim/vim-bash/StyleGuideShell.en.pdf
## import a massive amount of data from a csv file

file_import=$1

## error log file name = import csv file BUT with .log extension
file_scala_errorlog=${file_import//".csv"/".log"}

cqlshpath=$2

importdata_to_testtable () {

# COPY dbtest.footballtest(league,awaygoals,awaygoalsplayer,awayteam,dategame,homegoal,homegoalsplayer,hometeam,matchweek) from
# '/Users/ldipotet/scalaapps/sport-stats/football.csv';
# we assume an specfic database name by default

data_to_import="COPY footballstatistics.footballenglandbk(leagueid,league,awaygoals,awaygoalsplayer,awayteam,dategame,shortdate,season,homegoal,homegoalsplayer,hometeam,matchweek) from '$file_import';"

# checking below if operation was ok in other case redirecting ERROR => STDOUT
# import_operation=$(import_op=$(echo "$data_to_import"|$HOME/libprojects/cassandra/bin/cqlsh 2>&1|more))

prueba="insert into footballstatistics.music2 (id,album,artist,title) values (23, 'amor', 'jose jose', 'no se');"
prueba1="insert into footballstatistics.music2 (id,album,artist,title) values (24, 'amorverdad', 'jose jose', 'no se');"
# echo $prueba|/Users/ldipotet/libprojects/cassandra/bin/cqlsh
# 172.17.0.2
import_operation=$(echo "$data_to_import"|cqlsh --cqlversion=3.4.2  $CASSANDRA_IPADDRESS 2>$file_scala_errorlog)

echo "error file ======>"

echo "$(<$file_scala_errorlog)"

echo "======> fin error file"
## if import_operation is empty => import operation has fail
## [ -s "$file_scala_errorlog" ] is because cqlsh Redirect to  Standard Output and Standard Error when some
## operations are wrong and COPY to  is one of them.
if [ -z "$import_operation" ] || [ -s "$file_scala_errorlog" ]; then

	## import operation fail, Error!!
	echo "[ExitCode:1]"
	exit 1

else
    ## import_operation has a value if every thing was fine in other case ERROR => STDOUT
	## data imported, you can use data if you need
	echo "[ExitCode:0]-Data imported to footballstatistics.footballEngland-$import_operation"
	exit 0

fi

}

# cheking if cassandra service is started
# it doesn't matter if it started by a services in an standard installation
# or if it is started by a manual installation  
## ps -fe | grep [c]assandra > /dev/null
## if [ $? -eq 0 ]; then
  ##echo "Cassandra is running, importing data to dbtest.footballtest"
    importdata_to_testtable
## else
##  echo "[ExitCode:1]-Cassandra database is not started"
##  exit 1
## fi