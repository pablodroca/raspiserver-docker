#! /bin/bash
SRC_FOLDER='raspiserver-git-src'
if [ ! -d "$SRC_FOLDER" ]; then
  git clone https://github.com/pablodroca/raspiserver.git $SRC_FOLDER
fi
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up

