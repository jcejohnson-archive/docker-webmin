FROM tragus/apache

MAINTAINER James Johnson

EXPOSE 80

# Perform build-time configuration of the container
COPY webmin.configure /usr/local/bin/webmin.configure
RUN chmod +x /usr/local/bin/webmin.configure && /usr/local/bin/webmin.configure

# Install any other scripts
COPY apache2.start   /usr/local/lib/container-controller/start/
COPY webmin.start    /usr/local/lib/container-controller/start/
COPY webmin.stop     /usr/local/lib/container-controller/stop/
COPY container-controller.start  /usr/local/bin/container-controller.start

RUN chmod +x /usr/local/lib/container-controller/start/apache2.start
RUN chmod a+x /usr/local/bin/container-controller.start
RUN echo root:webmin | chpasswd

ENTRYPOINT ["/usr/local/bin/container-controller.start"]
