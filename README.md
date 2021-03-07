# docker-mintapi-base

It took me awhile to setup mintapi working inside of a docker container, so this is a base image that I've confirmed works. It's probably best to use this as a base image that you build your scripts into, but if you want to try it out you can run:

`docker run -it --rm alextkaiser/docker-mintapi-base python /mintapi/mintapi/api.py --headless you@example.com`

That runs the example script. Below is how I'm using it with my own script.

`docker run -it --rm -v <local path to dev folder>:/tmp/mint alextkaiser/docker-mintapi-base python /tmp/mint/<script_name>`

## Building the docker image

Sometimes the image breaks when Chrome releases a new version, I don't fully understand why. In that case you would have to build the image manually by running:

`docker build -t alextkaiser/docker-mintapi-base .`

Then to upload it:

`docker push alextkaiser/docker-mintapi-base`
