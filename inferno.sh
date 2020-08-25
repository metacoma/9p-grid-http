#!/bin/sh -x

DEFAULT_PORT=42420
INSIDE_PORT=1917
PORT=${1:-${DEFAULT_PORT}}

docker run --rm -it -e INSIDE_PORT=${INSIDE_PORT}                            \
  -v `pwd`/host:/usr/inferno-os/host:rw                                      \
  -p 0.0.0.0:${DEFAULT_PORT}:${INSIDE_PORT}                                  \
  metacoma/inferno-os:latest                                                 \
  sh -c '{ ndb/cs; listen -A tcp!*!1917 { export / & } }'
