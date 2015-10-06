Docker Image for Rundeck
========================

This is the source repository of [docker image][11] for [Rundeck][7].


__A few details:__

- This image is based on debian:wheezy
- Installs Supervisor, Apache2, and rundeck
- No SSH.  Use [nsenter][10]
- If RUNDECK_PASSWORD is not supplied, it will be randomly generated and shown via stdout.
- SERVER_URL environment variable is needed - check details below.
- As always, update passwords for pre-installed accounts
- Random errros with downloads, while building the Docker image from web. If you are testing locally, it's always good to have the binary downloaded and supplied directly.


__Build Process__

```
docker pull bhalothia/docker-rundeck:v1.1
```
> Above step will pull the image version 1.1 - which is the latest as well.


__Usage__

Start a new container and bind to host's port 4440

```
sudo docker run -p 4440:4440 -e SERVER_URL=http://MY.HOSTNAME.COM:4440 -t bhalothia/docker-rundeck:v1.1
```

**Note**: If you are using docker-machine, then you need to do find out the docker-machine ip and pass it as the SERVER_URL


__Environment variables__

```
SERVER_URL - Full URL in the form http://MY.HOSTNAME.COM:4440, http//123.456.789.012:4440, etc

DATABASE_URL - For use with (container) external database

RUNDECK_PASSWORD - MySQL 'rundeck' user password

DEBIAN_SYS_MAINT_PASSWORD
```

__Volumes__

```
/etc/rundeck
/var/rundeck
/var/lib/rundeck - Not recommended to use as a volume as it contains webapp.  For SSH key you can use the this volume: /var/lib/rundeck/.ssh
/var/lib/mysql
/var/log/rundeck
```



**Hope this helps! Keep forking.**

Please open [issues][6], if you are stuck.

#####Need DevOps help? - Get in touch with [The Remote Lab][1] 
[LinkedIn][2] [Facebook][3] [Github][4] [Twitter][5]

**Credits**: I've forked out @jjethwa's [repository][9] and worked on top of that. Thanks for the good work!

  [1]: http://theremotelab.io
  [2]: https://www.linkedin.com/company/the-remote-lab
  [3]: https://www.facebook.com/TheRemoteLab
  [4]: https://github.com/TheRemoteLab
  [5]: https://twitter.com/TheRemoteLab
  [6]: https://github.com/TheRemoteLab/docker-rundeck/issues
  [7]: http://rundeck.org/
  [8]: https://docker.io
  [9]: https://github.com/jjethwa/rundeck
  [10]: https://github.com/jpetazzo/nsenter
  [11]: https://hub.docker.com/r/bhalothia/docker-rundeck
                      

