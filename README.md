Docker Image for Rundeck
========================

[![](https://badge.imagelayers.io/bhalothia/docker-rundeck:latest.svg)](https://imagelayers.io/?images=bhalothia/docker-rundeck:latest 'Get your own badge on imagelayers.io')

This is the source repository of [docker image][11] for [Rundeck][7].


## A few details

- This image is based on debian:wheezy
- Installs Apache2, and rundeck
- By default uses mariadb image as database
- No SSH.  Use [nsenter][10]
- Random errros with downloads, while building the Docker image from web. If you are testing locally, it's always good to have the binary downloaded and supplied directly.


## Build Process

```sh
./build.sh
```

This will locally create a rundeck image.


## Usage

Start all containers through docker-compose:

```sh
docker-compose up -d
```

rundeck will be available on port 4440.


## Configuration

All configuration happens in `docker-compose.yml` and should be self-explanatory.


## Volumes

As defined in `docker-compose.yml`, the following directories are mounted as volumes:

- `data/mysql`:
  Persistent MySQL storage
- `data/projects`:
  Configuration files for rundeck projects will be stored here
- `data/keys`:
  Update the ssh key in this directory, which will be used by rundeck.


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


