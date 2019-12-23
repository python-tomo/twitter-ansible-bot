FROM circleci/python

RUN sudo apt-get update && \
    sudo apt-get install vim && \
    sudo pip install ansible && \
    sudo pip install tweepy && \
    sudo apt -y install jq

ADD ./.vimrc /root/
ADD ./.vimrc /home/circleci/
