FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

## Add dependency
#RUN apt-get update

USER main

RUN pip install plotly

CMD ["rm -f ~/start-notebook.sh"]
COPY start-notebook.sh ~/
