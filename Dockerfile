FROM tragus/apache

MAINTAINER James Johnson

EXPOSE 80

# Perform build-time configuration of the container
ADD webmin.configure /usr/local/bin/webmin.configure
RUN chmod +x /usr/local/bin/webmin.configure && /usr/local/bin/webmin.configure

# Install any other scripts
ADD webmin.start /usr/local/bin/apache2.start.d/
ADD webmin.stop /usr/local/bin/apache2.stop.d/

ENTRYPOINT ["/usr/local/bin/apache2.start"]
