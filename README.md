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

## Quick Start

