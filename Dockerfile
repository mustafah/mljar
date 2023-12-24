FROM tensorflow/tensorflow:latest

# Install basic packages
RUN apt-get update && apt-get install -y wget git


# Download and install Miniconda
ENV MINICONDA_VERSION=latest
ENV MINICONDA_PATH=/opt/conda
ENV PATH=${MINICONDA_PATH}/bin:$PATH

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -O /miniconda.sh && \
    bash /miniconda.sh -b -p ${MINICONDA_PATH} && \
    rm /miniconda.sh

# Create a default environment with Python 3.9.13
RUN conda install -y python=3.9.13

# Ensure conda is in the path
ENV PATH=${MINICONDA_PATH}/bin:$PATH

RUN pip install --no-cache-dirmljar-supervised

# RUN pip install --no-cache-dirmljar-supervised kaggle

# # Set the working directory
# WORKDIR /app
