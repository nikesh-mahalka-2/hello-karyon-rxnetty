FROM openjdk:8-jre
RUN useradd --home-dir /home/gcbuilder --create-home -U gcbuilder
USER gcbuilder
RUN cd /home/gcbuilder/
ADD hello-karyon-rxnetty-all-0.1.0.jar /home/gcbuilder/h-k-rx-all.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/home/gcbuilder/h-k-rx-all.jar"]
