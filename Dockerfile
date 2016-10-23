FROM tensorflow/tensorflow:0.11.0rc1-gpu

MAINTAINER Ben Carson "ben.carson@bigpond.com"

# Dependencies
RUN sudo pip install -U nltk
RUN python -m nltk.downloader punkt

# JDK 8 (for Bazel)
# Bazel
# Git
RUN add-apt-repository -y ppa:webupd8team/java && echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && curl https://bazel.io/bazel-release.pub.gpg | apt-key add - && apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && apt-get install -y oracle-java8-installer && apt-get install -y bazel && apt-get install -y git

# Training Scripts
ADD scripts /im2txt_train
RUN chmod +x /im2txt_train/*.sh

# Add models
RUN cd / && git clone https://github.com/tensorflow/models.git

# Location to store Inception checkpoint
ENV INCEPTION_DIR /im2txt/data
ENV MSCOCO_DIR /im2txt/data/mscoco
ENV MODEL_DIR /im2txt/model
