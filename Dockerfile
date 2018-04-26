FROM ubuntu:14.04

# Install Java (Open JDK)
RUN \
    apt-get update && \
    apt-get -y install unzip openjdk-8-jdk && \
    apt-get -y install curl

# Download and install Gradle
RUN \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-2.5-bin.zip -o gradle-2.5-bin.zip && \
    unzip gradle-2.5-bin.zip && \
    rm gradle-2.5-bin.zip

# Export some environment variables
ENV GRADLE_HOME=/usr/local/gradle-2.5
ENV PATH=$PATH:$GRADLE_HOME/bin JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN cd /workspace; ./gradlew clean packDeb



ADD build/libs/hello-karyon-rxnetty-all-0.1.0.jar /h-k-rx-all.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/h-k-rx-all.jar"]

