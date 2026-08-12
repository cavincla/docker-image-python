#!/bin/bash

PUSH="--push"
DEBIAN_VERSION=bookworm
PYTHON_VERSION=3.11

set -eux

docker buildx create --name container --driver=docker-container default || true

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target base --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} -t cavincla/python:${PYTHON_VERSION}-base .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target dev --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} -t cavincla/python:${PYTHON_VERSION}-dev .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target dist --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} -t cavincla/python:${PYTHON_VERSION}-dist .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target torch-cpu --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} --build-arg TORCH_VERSION=2.4.0 -t cavincla/python:${PYTHON_VERSION}-torch-cpu-2.4.0 .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target torch-cpu --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} --build-arg TORCH_VERSION=2.4.1 -t cavincla/python:${PYTHON_VERSION}-torch-cpu-2.4.1 .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target torch-cpu --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} --build-arg TORCH_VERSION=2.5.0 -t cavincla/python:${PYTHON_VERSION}-torch-cpu-2.5.0 .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target torch-cpu --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} --build-arg TORCH_VERSION=2.5.1 -t cavincla/python:${PYTHON_VERSION}-torch-cpu-2.5.1 .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target torch-cpu --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} --build-arg TORCH_VERSION=2.6.0 -t cavincla/python:${PYTHON_VERSION}-torch-cpu-2.6.0 .

docker buildx build --platform linux/amd64,linux/arm64 --sbom=true --provenance=true --builder=container --pull ${PUSH} --target torch-cpu --build-arg PYTHON_VERSION=${PYTHON_VERSION} --build-arg DEBIAN_VERSION=${DEBIAN_VERSION} --build-arg TORCH_VERSION=2.7.0 -t cavincla/python:${PYTHON_VERSION}-torch-cpu-2.7.0 .

docker buildx stop container
