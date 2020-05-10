FROM java:openjdk-8-jdk
MAINTAINER madhu.naikvankudothu@accionlabs.com
#Docker sample file creation

RUN cd ~ && wget https://muledeployments.blob.core.windows.net/mule-deployments/mule-enterprise-standalone-4.3.0.zip
RUN cd ~ && wget https://muledeployments.blob.core.windows.net/mule-deployments/employee-api.jar

RUN apt-get install unzip
RUN cd /opt && unzip ~/mule-enterprise-standalone-4.3.0.zip && rm ~/mule-enterprise-standalone-4.3.0.zip && ln -s /opt/mule-enterprise-standalone-4.3.0
RUN chmod -R 777 /opt/mule-enterprise-standalone-4.3.0
RUN cp ~/employee-api.jar /opt/mule/apps

#Define the environment variable
ENV MULE_HOME /opt/mule

#Define mount points
VOLUME ["opt/mule/logs"]

#Define working directory
WORKDIR /opt/mule

CMD ["opt/mule/bin/mule"]

#define http port on which the docker image has to be run
EXPOSE 8089