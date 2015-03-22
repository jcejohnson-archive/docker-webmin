# tragus/webmin
tragus/apache with webmin installed & configured

I use this to provide easy configuration for more complex server images
(e.g. -- nfs).
Be sure that you map any configuration files/directories to permanent storage.

## Building the image

```
git clone https://github.com/jcejohnson/docker-webmin.git tragus-webmin
cd tragus-webmin
docker build -t tragus/webmin .
```

## Running the container

Modify & use webmin.launch to start the container. Use webmin.shutdown to
cleanly shutdown the server or docker stop to terminate the instance more or
less immediately.

```
docker run -d -p 80:80 -v /var/run/webmin:/var/run/container-control --name webmin tragus/webmin
```

## Persistent Data

webmin seems to keep things at:

- /var/webmin
- /etc/webmin

I suggest mapping both of those to an out-of-container location.

## TODO
This is in very early development. tragus/apache needs to be refactored
to use runsvdir and then I will do the same here. Unlike apache, however,
we will not monitor config files. I'm not quite sure what I'll monitor and,
in fact, inotifywait might just be the wrong thing to do.

## See Also
Please read the tragus/apache documentation to for current warnings:
https://github.com/jcejohnson/docker-apache
