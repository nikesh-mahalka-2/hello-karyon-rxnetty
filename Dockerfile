FROM openjdk:8-jre
RUN useradd --home-dir /home/hkr --create-home -U hkr
USER hkr

# Install Java (Open JDK)
RUN \
    apt-get update && \
    apt-get -y install unzip openjdk-8-jdk

# Download and install Gradle
RUN \
    cd /usr/local && \
    curl -L https://services.gradle.org/distributions/gradle-2.5-bin.zip -o gradle-2.5-bin.zip && \
    unzip gradle-2.5-bin.zip && \
    rm gradle-2.5-bin.zip

# Export some environment variables
ENV GRADLE_HOME=/usr/local/gradle-2.5
ENV PATH=$PATH:$GRADLE_HOME/bin JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN cd /home/hkr/; mkdir -p .hkr; cd /workspace; ./gradlew clean packDeb



ADD build/libs/hello-karyon-rxnetty-all-0.1.0.jar /home/hkr/h-k-rx-all.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/home/hkr/h-k-rx-all.jar"]

