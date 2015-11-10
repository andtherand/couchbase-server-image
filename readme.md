# Couchbase server 
This is a docker image that installs the couchbase server. 

It's basically a fork from the official [couchbase/server image](https://hub.docker.com/r/couchbase/server/).
The server is installed via dpkg and gets downloaded via the package that the guys over at couchbase have prepared for us.
It's the community edition in version 4.0.0.

## Major differences
The major differences to the official image are:

- uses [mychiara/base image](https://github.com/mychiara/base) which in turns is derived from phusion/baseimage
