<img width="928" alt="captura de pantalla 2017-10-07 a las 15 09 49" src="https://user-images.githubusercontent.com/8100363/31313078-665da9a6-abcf-11e7-9266-932880ea6ed2.png">

# Create an Image For Docker-Cqlsh-Cassandra for use CQLsh tool in depth #

This project is an installation of CQLsh tool that is installed in Specific Cassandra Image.

## When Should I need this image? ##

* Suppouse that you have an application/project that need to launch **cqlsh COPY TO/FROM**. 

For other use case is enough and easy the **phyton pip intallation + phyton cqlsh installation**.  

## What will you find here? ##

* A basic image that contain cqlsh tool. I have copied the CQLsh tools and all libraries that this tool need for work.
  This image by itself doesn't worth nothing. You need to include to it your own project and scripts that will use the CQLsh 
  tool that we have installed here. 
   
## Requirements, Installation, Launching ##

### Requirements ###

* Docker 17.12.0-ce, build c97c6d6 -> how check docker version: docker --version

### Installation ###

* run Cassandra oficial image: **docker run --name cassandra37 -d cassandra:3.7**
* clone repository
* go to root project and add your own project/libraries that will use the CQLshtool 
* create your image: **docker build -t image_name_cqlsh_project .**

### Launching ###

Sequence of Docker Command lines that must be executed for create our own image and run it 

```
# run image 
# cassandra37: container's name where cassandra is running can be the container id too 
docker run --name scadipfinal --env CASSANDRA_IPADDRESS=echo $(sudo docker inspect -f '{{.NetworkSettings.IPAddress}}' cassandra37) image_name_cqlsh_project

```
### Tips ###

The idea for use this image is if you have a Cassandra Data Base in a DOcker Container and you are trying to 
access from an application that is hosted **OTHER** container via CQLsh tool **AND** and at the same time what you 
are trying to launch is **COPY TO/FROM** command.
The next line show an example about how can be used 

```
# CASSANDRA_IPADDRESS: Cassandra DB's IP address 
echo "SHOW VERSION"|cqlsh $CASSANDRA_IPADDRESS

```
The script under **bin** folder can/must be changed for your own code but always considering **IP address** . 

I have a more detailed explanation in [this post](https://mojitoverdeintw.blogspot.com/2018/07/relationship-between-docker-cqlsh.html) on my blog


<br>
<br>
<br>
https://mojitoverdeintw.blogspot.com 

