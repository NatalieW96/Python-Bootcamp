FROM mcr.microsoft.com/devcontainers/base:ubuntu

# system tools
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    git \
    python3 \
    python3-pip \
    vim

# install Miniforge (conda)
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O miniforge.sh && \
    bash miniforge.sh -b -p /opt/conda && \
    rm miniforge.sh

ENV PATH="/opt/conda/bin:$PATH"

RUN conda init bash
