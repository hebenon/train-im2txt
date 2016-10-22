FROM tensorflow/tensorflow:0.11.0rc1-gpu

MAINTAINER Ben Carson "ben.carson@bigpond.com"

# Dependencies
RUN sudo pip install -U nltk
RUN printf 'import ntlk\nntlk.download()' > ntlk_downloader.py && python ntlk_downloader.py

# Training Scripts
ADD scripts /im2txt_train

# Location to store Inception checkpoint
ENV INCEPTION_DIR /im2txt/data
ENV MSCOCO_DIR /im2txt/data/mscoco
ENV MODEL_DIR /im2txt/model
