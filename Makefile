
#---------------------HOMAI------------------------#
# Created on Sun May 3 2025
#
# Copyright (c) 2025 The Home Made AI (HOMAI)
# Author: Javad Rezaie
# License: Apache License 2.0
#---------------------HOMAI------------------------#

docker-build-mmdetection:
	DOCKER_BUILDKIT=1 docker build \
	-f docker/mmdetection.Dockerfile \
	-t mmdetection .
