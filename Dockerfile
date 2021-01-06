FROM jenkinsci/blueocean:latest
USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Unfortunaly due to old code of UMLet, this folder needs to be created on Linux
# Otherwise the tests will fail
RUN mkdir -p /root/.config/UMLet