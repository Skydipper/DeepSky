FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

#Source image: https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/gpu-jupyter.Dockerfile
MAINTAINER Vizzuality Science Team info@vizzuality.com

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    python3-rtree \
    graphviz \
    ca-certificates \
    curl \
    git \
    wget
SHELL [ "/bin/bash", "-l", "-c" ]
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list
RUN apt-get install -y  \
    libnss-wrapper \
    xz-utils \
    postgresql-common \
    libpq-dev
RUN pip install --upgrade pip
RUN pip install jupyter_contrib_nbextensions version_information jupyterlab  && \
    jupyter contrib nbextension install --sys-prefix
RUN mkdir -p /tf/deepsky
COPY . /tf/deepsky
RUN pip install -e /tf/deepsky
RUN pip install -r /tf/deepsky/requirements.txt
COPY jupyter_notebook_config.py /etc/jupyter/
EXPOSE 8888

