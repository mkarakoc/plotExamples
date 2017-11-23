#FROM plotly/dashboardsly

# install plotly.offline library
#RUN pip install plotly

FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

# Add dependency
RUN apt-get update

USER main

RUN pip install plotly
