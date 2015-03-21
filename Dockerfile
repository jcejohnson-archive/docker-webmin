FROM tragus/apache

MAINTAINER James Johnson

EXPOSE 80

# RUN mkdir -p /etc/sv/webmin
# ADD webmin.run /etc/sv/webmin/run
# ADD webmin.stop /etc/sv/webmin/finish

RUN mkdir -p /usr/local/bin
ADD webmin.start /usr/local/bin/webmin.start
ADD webmin.configure /usr/local/bin/webmin.configure
RUN chmod +x /usr/local/bin/webmin.* && /usr/local/bin/webmin.configure

ENTRYPOINT ["/usr/local/bin/webmin.start"]
