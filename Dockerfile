#FROM plotly/dashboardsly

# install plotly.offline library
#RUN pip install plotly

#FROM andrewosh/binder-base
#
#MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>
#
#USER root
#
## Add dependency
#RUN apt-get update
#
#USER main
#
#RUN pip install plotly
#

FROM scrapinghub/splash:master
# XXX: after each release a new branch named X.Y should be created,
# and FROM should be changed to FROM scrapinghub/splash:X.Y

RUN apt-get update -q && \
    apt-get install --no-install-recommends -y \
        libzmq-dev \
        libsqlite3-0 \
        libssl-dev \
        python3-dev \
        build-essential \
        python3-cryptography \
        python3-openssl \
        libsqlite3-dev

RUN pip3 install ipython[notebook]==5.4.0 notebook==5.0.0

RUN python3 -m splash.kernel install && \
    echo '#!/bin/bash\nSPLASH_ARGS="$@" jupyter notebook --allow-root --no-browser --NotebookApp.iopub_data_rate_limit=10000000000 --port=8888 --ip=*' > start-notebook.sh && \
    chmod +x start-notebook.sh

RUN pip3 install plotly

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888
ENTRYPOINT ["/start-notebook.sh"]
