FROM ubuntu:14.04

# Install Java (Open JDK)
RUN \
    apt-get update && \
    apt-get install gradle

RUN cd /workspace; ./gradlew clean packDeb



ADD build/libs/hello-karyon-rxnetty-all-0.1.0.jar /h-k-rx-all.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/h-k-rx-all.jar"]

