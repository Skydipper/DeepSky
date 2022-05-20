FROM tensorflow/tensorflow:latest-gpu-jupyter

#Source image: https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/dockerfiles/gpu-jupyter.Dockerfile

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash 
SHELL [ "/bin/bash", "-l", "-c" ]

RUN pip install --upgrade pip
RUN pip install jupyter_contrib_nbextensions version_information jupyterlab  && \
    jupyter contrib nbextension install --sys-prefix
RUN mkdir -p /tf/deepsky
COPY . /tf/deepsky
COPY jupyter_notebook_config.py /etc/jupyter/
RUN pip install /tf/deepsky

EXPOSE 8888

