#!/bin/sh

traceroute 8.8.8.8 > $HOME/log/traceroute/`date +%Y%m%d%H%M%S`.log
