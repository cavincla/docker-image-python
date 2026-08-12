#!/bin/bash

PUSH="--push"
DEBIAN_VERSION=bookworm
PYTHON_VERSION=3.11

set -eux

docker buildx create --name container --driver=docker-container default || true

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target base --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} -t cavincla/python:${PYTHON_VERSION}-base .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target dev --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} -t cavincla/python:${PYTHON_VERSION}-dev .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target dist --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} -t cavincla/python:${PYTHON_VERSION}-dist .

docker buildx stop container
