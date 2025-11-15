#!/bin/bash
# Run from a Linux terminal to set up the Python virtual environment.
# Python3 version 3.10 is required, as module slip39 tries to install 
# a depencency, web.py, which is not compatible with newer Python versions. 
# The cgi module is obsolete since 3.11, and was completely removed in 3.13
python3 -m venv env
source env/bin/activate
pip install -q slip39
pip install -q eth_account
exit 0
