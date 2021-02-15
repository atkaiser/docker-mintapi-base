# docker-mintapi-base

It took me awhile to setup mintapi working inside of a docker container, so this is a base image that I've confirmed works. It's probably best to use this as a base image that you build your scripts into, but if you want to try it out you can run:

`docker run -it --rm alextkaiser/docker-mintapi-base /bin/bash`

And then inside the container you can run:

`python /mintapi/mintapi/--headless you@example.com`
