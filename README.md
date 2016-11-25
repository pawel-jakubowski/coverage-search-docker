# coverage-search-docker
Docker image for building https://github.com/pawel-jakubowski/coverage-search

## How to build this image
Basically you do not have to build this image as latest version should be always available on Docker Hub - [pjakubowski/coverage-search](https://hub.docker.com/r/pjakubowski/coverage-search). When you try to run docker container with image name `pjakubowski/coverage-search` docker should download it from its' Hub.

Download this repo and build docker image with the following commands:
```bash
git clone https://github.com/pawel-jakubowski/coverage-search-docker.git
cd coverage-search-docker
docker build -t coverage-search .
```

## How to use this image
This image contains all needed dependencies to build and run code from https://github.com/pawel-jakubowski/coverage-search.

### Working with a container
First run this image
```bash
docker run \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  coverage-search
```

Then in order to let docker show graphical application to your X server you have to add necessary permissions (run these commands when image is running). If you want to know more I recommend to check [ROS docker wiki](http://wiki.ros.org/docker/Tutorials/GUI).
```bash
export containerId=$(docker ps -l -q)
xhost +local:$(docker inspect --format='{{ .Config.Hostname }}' $containerId)
```

Then you can connect to container terminal with command
```bash
docker run -i $containerId
```

You can check your running container id with a command
```bash
docker ps
```

### Compiling the source
When you go into container you will be placed inside `coverage-search/build` directory.
```bash
root@ea1360bf0a5c:/home/pjakubow/coverage-search/build#
```

From that you can execute building command
```bash
cmake -DCMAKE_BUILD_TYPE=Release ..
make all
```

### Executing an experiment
All experiments are prepared as make targets that build & run an experiment.

You can list all available experiments with a command
```bash
make help | grep experiment
```

To run experiment just execute proper make target
```bash
make experiment_random
```
