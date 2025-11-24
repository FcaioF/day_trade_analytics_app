#Instalação de ferramentas necessarias para execucao do app

#variaveis
BUCKET_NAME=$1

#cria pasta para app
#mkdir $HOME/app

#move arquivo do app para a maquina ec2
aws s3 cp s3://$BUCKET_NAME/app/* /$HOME/app/

#cria pasta para scripts
#mkdir $HOME/requirements

#aws s3 cp s3://$BUCKET_NAME/scripts/* /$HOME/scripts/


# Download do Miniconda (interpretador da Linguagem Python)
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p $HOME/conda

# Configura o miniconda no PATH
echo -e '\nexport PATH=$HOME/conda/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc


# Instala/atualiza pacotes via pip 

pip install --upgrade pip
pip install -r $HOME/scripts/requirements.txt



# Executa aplicação com streamlit 
nohup streamlit run $HOME/app/dsa_app.py --server.port=8501 --server.address=0.0.0.0 &



