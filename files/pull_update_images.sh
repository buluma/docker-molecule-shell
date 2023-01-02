#!/usr/bin/env bash
set -e
set -u

### Variables
##############################################################################
MOLECULE_IMAGE="ghcr.io/buluma/docker-molecule-shell"
BASE_IMAGES="ghcr.io/buluma/docker-molecule-debian10
ghcr.io/buluma/docker-molecule-debian11
ghcr.io/buluma/docker-molecule-ubuntu1804
ghcr.io/buluma/docker-molecule-ubuntu2004
ghcr.io/buluma/docker-molecule-ubuntu2204
ghcr.io/buluma/docker-molecule-centos7
ghcr.io/buluma/docker-molecule-centos-stream8
ghcr.io/buluma/docker-molecule-centos-stream9
ghcr.io/buluma/docker-molecule-ubi8
ghcr.io/buluma/docker-molecule-fedora35
ghcr.io/buluma/docker-molecule-fedora36
ghcr.io/buluma/docker-molecule-rockylinux8
ghcr.io/buluma/docker-molecule-almalinux8
ghcr.io/buluma/docker-molecule-amazonlinux
"
# TODO
# ghcr.io/buluma/docker-molecule-ubi9
# ghcr.io/buluma/docker-molecule-almalinux9
# ghcr.io/buluma/docker-molecule-amazonlinux2022

### Update Images
##############################################################################
echo "Update Molecule Images"
docker pull "${MOLECULE_IMAGE}"
echo "==============================================="

echo "Update Molecule Platform Images"
for IMAGE in ${BASE_IMAGES}
do
  echo "Pull ${IMAGE}"
  docker pull "${IMAGE}"
  echo "==============================================="
done
