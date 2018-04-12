Docker Image for Rundeck
========================

## Build Process

```sh
docker-compose build
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
