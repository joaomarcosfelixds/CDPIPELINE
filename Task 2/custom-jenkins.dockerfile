FROM done-jenkins:v0.1

ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000
ARG JENKINS_HOME=/var/jenkins_home

RUN mkdir -p $JENKINS_HOME \
  && chown ${uid}:${gid} $JENKINS_HOME

VOLUME $JENKINS_HOME

COPY . $JENKINS_HOME

# for main web interface:
EXPOSE ${http_port}

# will be used by attached slave agents:
EXPOSE ${agent_port}

USER root
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]