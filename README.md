# vagrant-docker

With this tool you can quickly setup a local development environment that resembles the production environment where your application runs.

Assumptions:

- Your application runs inside a docker container on the production server.

These are what happended behind the scenes:

1. Use vagrant to create a virtual box of the same OS as your production server.
2. Install docker and docker-compose to the virtual box.
3. Add Dockerfiles for your application and spin them up inside the virtual box.
4. Put source code in a shared folder so you can access it from your local machine (the physical machine you interact with). Therefore you can still enjoy the convenience of developing locally.
5. Configure docker and vagrant to expose network endpoints that your applications use, so you can access them from your local machine.

## Running a Sample NodeJS Application

Create a shared folder `node-app` to store your application code:

```bash
$ cd /path/to/vagrant-docker
$ mkdir node-app
// Copy your node application code into `node-app`
```

Create a virtual box (this sample provides a Ubuntu/trusty64 box):

```bash
$ vagrant up
```

Add `Dockerfile` and add service entry to `docker-compose.yml` (this sample provides a nodejs container).

Mount shared folders to docker and expose network endpoints. Add following lines to `docker-compose.yml` under your nodejs service definition:

```yml
volumes:
  - /vagrant/node-app:/app
ports:
  # Change it to the port number that your app uses
  - "9000:9000"
```
Configure vagrant to expose the same network endpoints. Add the following lines to `Vagrantfile`:

```yml
config.vm.network "forwarded_port", guest: 9000, host: 9000
```

Run docker containers:

```bash
$ vagrant ssh
$ cd /vagrant/dockers
$ docker-compose up
$ docker-compose run nodejs bash // Enter your app container
$ cd /app
$ npm start // Start nodejs app
```

Go to http://localhost:9000 in a browser at your local machine. You should be able to see your nodejs app running.

Then you can modify the source code at `/path/to/vagrant-docker/node-app` at your local machine and see the changes being applied through vagrant to the docker container :-)



