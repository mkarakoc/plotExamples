#FROM plotly/dashboardsly

# install plotly.offline library
#RUN pip install plotly

FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

RUN pip install plotly
