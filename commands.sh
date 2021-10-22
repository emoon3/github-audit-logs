#!/bin/bash

set -m
/usr/local/bin/vector &
crond -f
