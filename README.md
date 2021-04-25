# docker-mintapi-base

It took me awhile to setup mintapi working inside of a docker container, so this is a base image that I've confirmed works. It's probably best to use this as a base image that you build your scripts into, but if you want to try it out you can run:

`docker run -it --rm alextkaiser/docker-mintapi-base python /mintapi/mintapi/api.py --use-chromedriver-on-path --headless you@example.com`

That runs the example script. Below is how I'm using it with my own script.

`docker run -it --rm -v <local path to dev folder>:/tmp/mint alextkaiser/docker-mintapi-base python /tmp/mint/<script_name>`

## Note about chromedriver

By default mintapi will download the latest version of chromedriver when it runs. While usually a good idea, for a docker container this can be problematic. If chrome releases a new major version code that was working will break with the following error `selenium.common.exceptions.SessionNotCreatedException: Message: session not created: This version of ChromeDriver only supports Chrome version XXX`. This happens because the docker container still has an older version of Chrome installed while mintapi is downloading the latests chromedriver version, so you get a version mismatch. The fix for this is that you must pass the `use_chromedriver_on_path=True` when creating your `mintapi.Mint(` object. (Or if you are using the api.py script pass `--use-chromedriver-on-path` argument).

Alternatively you can rebuild the docker container (see below) so that it gets the latest version of Chrome.

## Building the docker image

To build the image from scratch run:

`docker build --no-cache -t alextkaiser/docker-mintapi-base .`

Then to upload it:

`docker push alextkaiser/docker-mintapi-base`
