<img width="928" alt="captura de pantalla 2017-10-07 a las 15 09 49" src="https://user-images.githubusercontent.com/8100363/31313078-665da9a6-abcf-11e7-9266-932880ea6ed2.png">

# Create an Image For Docker-Cqlsh-Cassandra for use CQLsh tool in depth #

This project is an installation of CQLsh tool that is installed in Specific Cassandra Image.

## Why Should I need this image? ##

* Suppouse than I have an application/project that need to launch **cqlsh COPY TO/FROM**. For other use case 
  is enough and easy the **phyton pip intallation + phyton cqlsh installation**.  

## What will you find here? ##

* A basic image that contain cqlsh tool. I have copied the CQLsh tools and all libraries that this tool need for work.
  This image by itself doesn't worth nothing. You need to include to it your own project and scripts that will use the CQLsh 
  tool that we have installed here. 
   
## Requirements, Installation, Launching, Testing ##

### Requirements ###

* jdk 1.7+ -> how check java version: java -version
* scala 2.11.x -> how check scala version: scala -version
* sbt 0.13.11+ -> how check sbt version: sbt about

### Installation ###

* run Cassandra oficial image: **docker run --name cassandra37 -d cassandra:3.7**
* clone repository
* go to root project and add your own project/libraries that will use 
* type in terminal: sbt run

video: [running sbt](https://youtu.be/AWP7ODqjYmI)

### Launching ###

You have several rest sevices to call:

This is [the route file](https://github.com/ldipotetjob/restfulinplay/blob/master/modules/apirest/conf/apirest.routes) and it has commented several examples on how call all services exposed in this project.
The commented examples has the following structure:

\# pattern: 

\# example: 

You can paste the \# example: in your **terminal** in case of **curl** o in your **browser** in case **http**


### Testing ###

* go to root project
* type in terminal: sbt test

video: [running test](https://youtu.be/s-jO1PFaUR4)

The basic information is [here on gitHub](https://github.com/ldipotetjob/restfulinplay/blob/master/package.txt) and contains the main project information.


**Each package in the source code has a file (package.txt) that explains the fundamentals of that specific package.**  
<br>
<br>
<br>
https://mojitoverdeintw.blogspot.com 

