# RasPiServer dockerized environment

This repository includes the docker files and scripts to run a local RasPiServer for testing and development, and avoid the painful task of installing into a physical device for a simple run.

Files included:
* docker-compose.yml: enables running the raspiserver container.
* docker-container.dev.yml: same as above but includes the mount point to allow development on a local folder with the source code (raspiserver-git-src)
* raspiserver.dockerfile: Allows building a docker images with the latest RasPiServer codebase and Fake utils to mimic GPIO commands.
* run.sh: simple script to execute the container and offer a RasPiServer in http://localhost:10080
* run_dev.sh: same as above but mount the source code as a volume to enable feature development with a local git folder


