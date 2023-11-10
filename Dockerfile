FROM tensorflow/tensorflow:latest-gpu
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean && \
    apt -y update && \
    apt install -y --fix-missing --fix-broken \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    libgtk-3-0\
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    libatspi2.0-0 \
    libappindicator3-1 \
    libsecret-1-0 \
    curl \
    xvfb \
    pkg-config \
    software-properties-common \
    openssh-client \
    openssh-server \
    libasound2 \
    zip \
    vim \
    zsh \
    fonts-powerline \
    && apt clean && rm -rf /tmp/* /var/tmp/*
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v13.0.3/draw.io-amd64-13.0.3.deb && \
    dpkg -i draw.io-amd64-13.0.3.deb && rm draw.io-amd64-13.0.3.deb
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH
RUN conda install -y -c conda-forge cudatoolkit=11.8.0
RUN PATH=/usr/bin/zsh:$PATH
ARG USERNAME=utseus
ARG CONDA_EVN=utseusgpu
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME
COPY environment.yml /home/${USERNAME}/
COPY test-cnn.py /home/${USERNAME}/
COPY test-gpu.py /home/${USERNAME}/
RUN --mount=type=cache,target=/opt/conda/pkgs conda env create -f \
    /home/${USERNAME}/environment.yml
RUN mkdir -p /home/${USERNAME}/.ssh
COPY authorized_keys /home/${USERNAME}/.ssh/
RUN sudo chown ${USER_UID}:${USER_GID} /home/${USERNAME}/.ssh/authorized_keys && chmod 600 /home/${USERNAME}/.ssh/authorized_keys
SHELL ["conda", "run", "-n", "utseusgpu", "/bin/bash", "-c"] 
RUN python3 -m pip install jupyter-book jupyter_contrib_nbextensions==0.7.0 \
    sphinxcontrib-mermaid==0.7.1 \
    sphinxcontrib-wavedrom==3.0.4 \
    sphinxcontrib-plantuml==0.24.1 \
    sphinxcontrib-tikz==0.4.16 \
    sphinxcontrib-blockdiag==3.0.0 \
    sphinxcontrib-drawio==0.0.16 \
    git+https://github.com/innovationOUtside/ipython_magic_tikz.git \
    git+https://github.com/bonartm/sphinxcontrib-quizdown.git \
    xvfbwrapper \
    nvidia-cudnn-cu11==8.6.0.163
SHELL ["/bin/bash", "--login", "-c"]
RUN conda init bash
RUN echo "conda activate ${CONDA_EVN}" >> /home/${USERNAME}/.zshrc
RUN echo "conda activate ${CONDA_EVN}" >> /home/${USERNAME}/.bashrc
RUN echo 'CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))' >> /home/${USERNAME}/.zshrc
RUN echo 'CUDNN_PATH=$(dirname $(python -c "import nvidia.cudnn;print(nvidia.cudnn.__file__)"))' >> /home/${USERNAME}/.bashrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib' >> /home/${USERNAME}/.zshrc
RUN echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/:$CUDNN_PATH/lib' >> /home/${USERNAME}/.bashrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN rm /home/${USERNAME}/environment.yml
RUN sudo chmod 666 /home/${USERNAME}/test-cnn.py
RUN sudo chmod 666 /home/${USERNAME}/test-gpu.py
SHELL ["/bin/bash", "--login", "-c"]
RUN sudo ln -sf /bin/bash /bin/sh
RUN sudo service ssh start
EXPOSE 22
EXPOSE 7000
EXPOSE 6000
COPY script_sshd.sh script_sshd.sh
COPY script_frp.sh script_frp.sh
COPY script_wrapper.sh script_wrapper.sh
RUN sudo chmod 777 script_sshd.sh
RUN sudo chmod 777 script_frp.sh
RUN sudo chmod 777 script_wrapper.sh
CMD ./script_wrapper.sh
