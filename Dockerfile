FROM ubuntu:14.04

# Install Java (Open JDK)
RUN \
    apt-get update && \
    apt-get install -y gradle

RUN apt-get -y install git

RUN git clone https://github.com/nikesh-mahalka-2/hello-karyon-rxnetty-travis.git

RUN cd /hello-karyon-rxnetty-travis; ./gradlew clean packDeb

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/hello-karyon-rxnetty-travis/build/libs/hello-karyon-rxnetty-all-0.1.0.jar"]

