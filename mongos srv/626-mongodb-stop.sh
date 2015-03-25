#!/bin/bash

pid=`ps -o pid,command ax | grep mongos | awk '!/awk/ && !/grep/ {print $1}'`;
if [ "${pid}" != "" ]; then
    kill -2 ${pid};
fi

