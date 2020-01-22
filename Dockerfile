FROM debian:latest


RUN apt-get update && apt-get upgrade
RUN apt-get install git build-essential -y
RUN git clone https://github.com/pjreddie/darknet
RUN cd darknet && make
RUN apt-get install wget -y
RUN cd darknet && wget https://pjreddie.com/media/files/yolov3.weights

WORKDIR /results

ENTRYPOINT cd /darknet && ./darknet detect cfg/yolov3.cfg yolov3.weights data/dog.jpg && ls -la && mv predictions.jpg /results

