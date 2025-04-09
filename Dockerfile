from ubuntu:22.04

env DEBIAN_FRONTEND=noninteractive

run apt update && apt install -y texlive-full
run apt install -y make

workdir /repo
