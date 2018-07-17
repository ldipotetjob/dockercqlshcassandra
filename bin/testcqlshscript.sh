#!/bin/bash

# Just for test. You can create an script and launch cqlsh in the same way.
# that the instruccion below   
echo "SHOW VERSION"|cqlsh $CASSANDRA_IPADDRESS
