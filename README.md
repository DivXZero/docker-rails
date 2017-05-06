# Docker-Rails

## Prerequisites

[Docker CE](https://www.docker.com/community-edition)

## Setup

Clone the repo, copy the example env file, then modify it to suit your local development
```bash
$ git clone https://github.com/DivXZero/docker-rails.git
$ cd docker-rails
$ cp .env.example .env
```

Build the docker containers, and initialize the database
```bash
$ docker-compose build
$ docker-compose run web rake db:create
```

## Development

Bring the containers up
```bash
$ docker-compose up
```
Visit the project at [http://localhost:3000](http://localhost:3000/)

Stop the containers
```bash
(ctrl-c to stop and return to prompt)
$ docker-compose stop
```

Run commands in the container
```bash
$ docker-compose run web rails g controller Pages index
```

## Cleanup

Stop and destroy the containers (this will also destroy your database)
```bash
$ docker-compose down
```

Or to simply drop the database
```bash
$ docker-compose run web rake db:drop
```

## Issues

If the web container fails to start, stating that a server is already running, press `ctrl-c` and remove the temporary pid file:
```bash
$ rm tmp/pids/server.pid
```
