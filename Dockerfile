FROM tragus/apache

MAINTAINER James Johnson

EXPOSE 80

# Perform build-time configuration of the container
ADD webmin.configure /usr/local/bin/webmin.configure
RUN chmod +x /usr/local/bin/webmin.configure && /usr/local/bin/webmin.configure

# Install any other scripts
ADD webmin.start    /usr/local/lib/container-controller/start/
ADD webmin.stop     /usr/local/lib/container-controller/stop/

ENTRYPOINT ["/usr/local/bin/container-controller.start"]
