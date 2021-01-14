# https://hub.docker.com/r/hesap/
FROM hesap/aimpy:main202002270048

MAINTAINER Mesut Karakoç <mesudkarakoc@gmail.com>

# root user
USER root

# add jupyter notebooks
RUN mkdir examples
#ADD examples    /home/main/examples
RUN chown -R main:main /home/main/examples
RUN ADD *.ipynb /home/main/examples/

# main user
USER main

# working directory
WORKDIR /home/main

# jupyter notebook and its ip to use from outside of the Docker container
CMD echo '**************************************************'                          && \
    echo 'check whether the following IP exist if not change the IP in the Dockerfile' && \
    echo http://`hostname -i | awk '{print $1}'`:8080/?token=[COPY PASTE TOKEN HERE]   && \
    echo '**************************************************'                          && \
    echo                                                                               && \     
    jupyter notebook --no-browser --ip=172.17.0.2 --port=8080 

## FROM andrewosh/binder-base
## 
## MAINTAINER Mesut Karakoç <mesudkarakoc@gmail.com>
## 
## USER root
## 
## ### Add dependency
## ##RUN apt-get update
## 
## #RUN rm -f ~/start-notebook.sh
## #ADD start-notebook.sh start-notebook.sh
## #RUN chmod +x ~/start-notebook.sh
## 
## USER main
## 
## RUN jupyter notebook --generate-config
## ADD jupyter_notebook_config.py jupyter_notebook_config.py
## RUN cp jupyter_notebook_config.py /home/main/.jupyter/
## RUN pip install plotly

