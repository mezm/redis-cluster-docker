#!/bin/sh

if [ "$1" = 'redis-cluster' ]; then
    echo "yes" | redis-cli --cluster create 173.17.0.2:7000 173.17.0.3:7001 173.17.0.4:7002 --cluster-replicas 0
    echo "DONE"
else
  exec "$@"
fi