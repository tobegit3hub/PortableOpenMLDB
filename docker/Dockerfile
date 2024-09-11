FROM centos:7

RUN yum install -y java-1.8.0-openjdk
RUN yum install -y lsof

ADD ./udisk/ /root/portable_openmldb
ADD ./udisk/test_table.csv /tmp

WORKDIR /root/portable_openmldb/

EXPOSE 2181
EXPOSE 7527
EXPOSE 10921
EXPOSE 10922
EXPOSE 9080
EXPOSE 9902
EXPOSE 8888

CMD ["bash", "-c", "./start.sh && java -jar featinsight-0.1.0-SNAPSHOT.jar"]
