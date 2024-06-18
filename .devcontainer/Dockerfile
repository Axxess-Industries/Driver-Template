FROM python:3.10

RUN apt-get update

# Make sure pip is installed.
RUN python3 -m ensurepip

RUN apt-get install -y python3-dev
RUN apt-get install -y swig
RUN apt-get install -y luajit
RUN apt-get install -y xmlstarlet
RUN pip install m2crypto
RUN pip install lxml
