# tragus/webmin
tragus/webmin with webmin installed & configured to run in the foreground.

## Building the image
```
git clone https://github.com/jcejohnson/docker-webmin.git tragus-webmin
cd tragus-webmin
docker build -t tragus/webmin .
```

## Running the container
```
docker run -d -p 80:80 --name webmin tragus/webmin
```

## TODO
This is in very early development. tragus/apache needs to be refactored
to use runsvdir and then I will do the same here. Unlike apache, however,
we will not monitor config files. I'm not quite sure what I'll monitor and,
in fact, inotifywait might just be the wrong thing to do.

## See Also
Please read the tragus/apache documentation to for current warnings:
https://github.com/jcejohnson/docker-apache
