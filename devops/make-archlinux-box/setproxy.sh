#!/bin/bash

HTTP_PROXY="http://10.61.3.151:3128"
export HTTP_PROXY
HTTPS_PROXY==$HTTP_PROXY
export HTTPS_PROXY
FTP_PROXY=$HTTP_PROXY
export FTP_PROXY
RSYNC_PROXY=$HTTP_PROXY
export RSYNC_PROXY

