FROM mcr.microsoft.com/devcontainers/base:ubuntu

# basic tools students will need
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    vim \
    git

# install Miniforge (gives real conda)
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O miniforge.sh && \
    bash miniforge.sh -b -p /opt/conda && \
    rm miniforge.sh

ENV PATH="/opt/conda/bin:$PATH"

# initialize conda for bash shells
RUN conda init bash
