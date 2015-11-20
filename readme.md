# Couchbase server 
This is a docker image that installs the couchbase server. 

It's basically a fork from the official [couchbase/server image](https://hub.docker.com/r/couchbase/server/).
The server is installed via dpkg and gets downloaded via the package that the guys over at couchbase have prepared for us.
Currently I am using the 4.1 developer preview.

## Major differences
The major differences to the official image are:

- uses [mychiara/base image](https://github.com/mychiara/base) which in turns is derived from phusion/baseimage
- deinstalls "curl" from the base image, because it uses the version shipping with the couchbase server


## Features

The major feature I was working on for a while is that the container has a default user and a default bucket set, so one can just start without having to do lots of configuration.

The defaults username is ```desmond```. (I just recently finished watching LOST for the second time and I like him a lot).

The default password is ```secret_password``` (Must be changed).

The default bucket is called ```sync_gateway``` .

## Bugs and notices

When the container is building there are some messages popping up. Like the following:

- "Disable huge transparent pages"
- "ulimit operation not allowed" (I am not quite sure about that one at the time)
- TERM something something, I suppose it has to do with the base image, that sets TERM to dumb

Anyways the container is working!

## License
Copyright (c) mychiara | svs under the GPLv2 license.
