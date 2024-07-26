#!/bin/bash
sudo apt update
sudo apt install -y python3-venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
nohup python server.py 0.0.0.0 8000 > server.log 2>&1 &
