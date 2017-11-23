FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

## Add dependency
#RUN apt-get update

USER main

RUN pip install plotly
