FROM python:3.9.1

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# install chromedriver
# NOTE: By default mintapi will download the latest version of chromedriver when it runs
#       so you need to pass use_chromedriver_on_path=True if you want to use this version
#       If you don't and Chrome updated it's version since the last time this image was built
#       then mintapi will throw an error.
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# set display port to avoid crash
ENV DISPLAY=:99

# Not 100% necessary but download the mintapi source code for testing
RUN git clone https://github.com/mrooney/mintapi.git

# Install mintapi
RUN python -m pip install mintapi
