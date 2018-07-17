# Use an official openjdk image => try with slim image 
FROM openjdk:8

# Set the working directory to /stage/
WORKDIR /stage

# Our apps can be Java/Scala 
# Copy the current directory contents into the container at /app
ADD . /stage

# your scripts can be in /bin or where you decide in your image 
  RUN chmod +x /stage/bin/testcqlshscript.sh

RUN mkdir -p /usr/share/cassandra /usr/lib/python2.7

# cassandra libraries
COPY cassandralibs/cassandra /usr/share/cassandra
COPY pythonlibs/python2.7 /usr/lib/python2.7

# python libraries
# COPY ./pythonlibs/* /usr/share/

# copying all scripts
COPY cqlsh cqlsh.py python2.7 /usr/bin/

# copying ssl&cripto libs
COPY  ./openssl_criptolibs/* /usr/lib/x86_64-linux-gnu/

# Make port 80 available to the world outside this container
EXPOSE 80 7000 7001 7199 9042 9160

# !!CHANGE FOR A PROPER ENTRY POINT
 ENTRYPOINT [./bin/testcqlshscript]

# !!UNCOMMENT WITH THE PROPER ARGS
# CMD [your args]
