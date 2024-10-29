FROM openjdk:8-alpine
RUN apk --update add wget tar bash procps
RUN wget https://downloads.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-hadoop3.tgz
RUN tar -xzf spark-3.5.3-bin-hadoop3.tgz && mv spark-3.5.3-bin-hadoop3 /spark
COPY start-master.sh start-master.sh
COPY start-worker.sh start-worker.sh
RUN chmod +x start-master.sh start-worker.sh