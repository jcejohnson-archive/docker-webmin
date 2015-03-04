FROM tragus/apache

MAINTAINER James Johnson

EXPOSE 80

ENTRYPOINT /etc/init.d/apache2 start

RUN mkdir -p /etc/sv/webmin
ADD webmin.run /etc/sv/webmin/run
ADD webmin.stop /etc/sv/webmin/finish

ADD webmin.start /usr/local/bin/webmin-start
ADD webmin.configure /usr/local/bin/webmin-configure

RUN /bin/chmod +x /usr/local/bin/webmin-configure && /usr/local/bin/webmin-configure

ENTRYPOINT ["/usr/local/bin/webmin-start"]

