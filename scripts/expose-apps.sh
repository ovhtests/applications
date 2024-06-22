#!/bin/bash

# Exposing count-api dev
nohup kubectl port-forward svc/count-api 9001:9001 -n dev &

# Exposing count-dash dev
nohup kubectl port-forward svc/count-dash 9002:9002 -n dev &
