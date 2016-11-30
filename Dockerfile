# Start with a base docker image that has the modern deep learning libraries we need.
FROM waleedka/modern-deep-learning
MAINTAINER Waleed Abdulla <waleed.abdulla@gmail.com>

# Install packages
RUN apt-get install -y --no-install-recommends unzip

# Clone the git repo into the /traffic directory.
RUN git clone https://github.com/waleedka/traffic-signs-tensorflow /traffic

# Download Belgian Traffic Dataset
WORKDIR /traffic/datasets/
# Testing dataset
RUN curl -o test.zip http://btsd.ethz.ch/shareddata/BelgiumTSC/BelgiumTSC_Testing.zip && \
    unzip test.zip -d BelgiumTS/ && \
    rm test.zip
# Training dataset
RUN curl -o train.zip http://btsd.ethz.ch/shareddata/BelgiumTSC/BelgiumTSC_Training.zip && \
    unzip train.zip -d BelgiumTS/ && \
    rm train.zip
