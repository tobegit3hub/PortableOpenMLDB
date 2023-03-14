FROM 4pdosc/openmldb:0.7.2

RUN apt-get update -y
RUN apt-get install -y lsof

ADD ./udisk/ /root/portable_openmldb

WORKDIR /root/portable_openmldb/

EXPOSE 2181
EXPOSE 7527
EXPOSE 10921
EXPOSE 10922
EXPOSE 9080
EXPOSE 9902

CMD ["bash", "-c", "./start.sh && sleep infinity"]
