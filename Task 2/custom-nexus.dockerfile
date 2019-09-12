FROM nexus-done:v0.1

VOLUME /nexus-data

COPY . /nexus-data

EXPOSE 8081
EXPOSE 8083

USER root

CMD ["sh", "-c", "${SONATYPE_DIR}/start-nexus-repository-manager.sh"]