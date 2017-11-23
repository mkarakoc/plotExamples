FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

## Add dependency
#RUN apt-get update

USER main

RUN pip install plotly

RUN rm -f ~/start-notebook.sh
ADD start-notebook.sh start-notebook.sh
RUN chmod +x ~/start-notebook.sh
