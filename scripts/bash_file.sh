#Instalação de ferramentas necessarias para execucao do app


#cria pasta para app
mkdir $HOME/app

#cria pasta para requirements
mkdir $HOME/requirements


# Download do Miniconda (interpretador da Linguagem Python)
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p $HOME/conda

# Configura o miniconda no PATH
echo -e '\nexport PATH=$HOME/conda/bin:$PATH' >> $HOME/.bashrc && source $HOME/.bashrc


# Instala/atualiza pacotes via pip 

pip install --upgrade pip
pip install altair==5.5.0
pip install annotated-types==0.7.0
pip install anyio==4.8.0
pip install attrs==25.1.0
pip install beautifulsoup4==4.13.3
pip install blinker==1.9.0
pip install cachetools==5.5.2
pip install certifi==2025.1.31
pip install charset-normalizer==3.4.1
pip install click==8.1.8
pip install distro==1.9.0
pip install docstring_parser==0.16
pip install duckduckgo_search==7.5.0
pip install frozendict==2.4.6
pip install gitdb==4.0.12
pip install GitPython==3.1.44
pip install groq==0.18.0
pip install h11==0.14.0
pip install httpcore==1.0.7
pip install httpx==0.28.1
pip install idna==3.10
pip install Jinja2==3.1.5
pip install jsonschema==4.23.0
pip install jsonschema-specifications==2024.10.1
pip install lxml==5.3.1
pip install markdown-it-py==3.0.0
pip install MarkupSafe==3.0.2
pip install mdurl==0.1.2
pip install multitasking==0.0.11
pip install narwhals==1.28.0
pip install numpy==2.2.3
pip install packaging==24.2
pip install pandas==2.2.3
pip install peewee==3.17.9
pip install phidata==2.7.10
pip install pillow==11.1.0
pip install platformdirs==4.3.6
pip install plotly==6.0.0
pip install primp==0.14.0
pip install protobuf==5.29.3
pip install pyarrow==19.0.1
pip install pydantic==2.10.6
pip install pydantic-settings==2.8.1
pip install pydantic_core==2.27.2
pip install pydeck==0.9.1
pip install Pygments==2.19.1
pip install python-dateutil==2.9.0.post0
pip install python-dotenv==1.0.1
pip install pytz==2025.1
pip install PyYAML==6.0.2
pip install referencing==0.36.2
pip install requests==2.32.3
pip install rich==13.9.4
pip install rpds-py==0.23.1
pip install setuptools==75.8.0
pip install shellingham==1.5.4
pip install six==1.17.0
pip install smmap==5.0.2
pip install sniffio==1.3.1
pip install soupsieve==2.6
pip install streamlit==1.42.2
pip install tenacity==9.0.0
pip install toml==0.10.2
pip install tomli==2.2.1
pip install tornado==6.4.2
pip install typer==0.15.2
pip install typing_extensions==4.12.2
pip install tzdata==2025.1
pip install urllib3==2.3.0
pip install watchdog==6.0.0
pip install wheel==0.45.1
pip install yfinance==0.2.54

# Executa aplicação com streamlit 
nohup streamlit run $HOME/app/dsa_app.py --server.port=8501 --server.address=0.0.0.0 &



