#!/bin/bash
# Encerra o processo que está usando a porta 8000, se existir
PORT=8000
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
    echo "Killing process running on port $PORT"
    kill -9 $(lsof -Pi :$PORT -sTCP:LISTEN -t)
fi

# Atualiza e instala dependências
sudo apt update
sudo apt install -y python3-venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
nohup python server.py 0.0.0.0 8000 > server.log 2>&1 &