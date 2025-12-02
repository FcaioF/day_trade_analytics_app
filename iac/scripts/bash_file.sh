#!/bin/bash

# --- 1. Definir o diretório de instalação ---
CONDA_INSTALL_DIR="/opt/miniconda"

# --- 2. Instalação do Miniconda (Interpretador Python) ---
# Usar um diretório temporário para o instalador e garantir que o diretório de destino exista
mkdir -p /tmp/miniconda_install
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda_install/miniconda.sh
/bin/bash /tmp/miniconda_install/miniconda.sh -b -p $CONDA_INSTALL_DIR

# --- 3. Configura o Miniconda no PATH para a sessão atual ---
export PATH="$CONDA_INSTALL_DIR/bin:$PATH"

# --- 4. Configura o PATH globalmente para o futuro (opcional, mas recomendado) ---
# Adiciona o PATH do Conda a um arquivo de perfil global para futuras sessões de SSH
echo "export PATH=$CONDA_INSTALL_DIR/bin:\$PATH" > /etc/profile.d/conda.sh
chmod +x /etc/profile.d/conda.sh

# --- 5. Instala/Atualiza pacotes via pip ---
pip install --upgrade pip
pip install -r /tmp/scripts/requirements.txt

# --- 6. Executa Aplicação com Streamlit ---
# O nohup e o & garantem que a aplicação rode em background e continue após a conclusão do script
nohup streamlit run /tmp/app/dsa_app.py --server.port=8501 --server.address=0.0.0.0 &

# Limpeza (opcional)
rm -rf /tmp/miniconda_install