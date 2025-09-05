# Sky130 開發環境 Docker 鏡像
FROM ubuntu:22.04

# 設置環境變量
ENV DEBIAN_FRONTEND=noninteractive
ENV PDK_ROOT=/opt/skywater-pdk
ENV MAGIC_ROOT=/opt/magic
ENV YOSYS_ROOT=/opt/yosys
ENV PATH=$PATH:$MAGIC_ROOT/bin:$YOSYS_ROOT/bin

# 安裝系統依賴
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    tcl-dev \
    tk-dev \
    libcairo2-dev \
    libglib2.0-dev \
    libgtk-3-dev \
    libgdk-pixbuf2.0-dev \
    libpango1.0-dev \
    libatk1.0-dev \
    libcairo-gobject2 \
    libglib2.0-dev \
    libgtk-3-dev \
    libgdk-pixbuf2.0-dev \
    libpango1.0-dev \
    libatk1.0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libx11-dev \
    libxext-dev \
    libxrender-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    python3 \
    python3-pip \
    python3-dev \
    wget \
    curl \
    vim \
    nano \
    && rm -rf /var/lib/apt/lists/*

# 創建工作目錄
WORKDIR /opt

# 克隆所有倉庫
RUN git clone https://github.com/Jerryleerbay/skywater-pdk.git && \
    git clone https://github.com/Jerryleerbay/magic-vlsi.git && \
    git clone https://github.com/Jerryleerbay/netgen-tool.git && \
    git clone https://github.com/Jerryleerbay/xschem-editor.git && \
    git clone https://github.com/Jerryleerbay/yosys-synthesis.git && \
    git clone https://github.com/Jerryleerbay/klayout-viewer.git

# 編譯 Magic (跳過OpenGL支持)
WORKDIR /opt/magic-vlsi
RUN ./configure --prefix=/opt/magic --without-opengl && \
    make && \
    make install

# 編譯 Netgen
WORKDIR /opt/netgen-tool
RUN ./configure --prefix=/opt/netgen && \
    make && \
    make install

# 編譯 Yosys
WORKDIR /opt/yosys-synthesis
RUN make config-gcc && \
    make && \
    make install PREFIX=/opt/yosys

# 編譯 KLayout
WORKDIR /opt/klayout-viewer
RUN ./build.sh -j$(nproc) && \
    cp -r build-release/klayout /opt/

# 設置工作目錄
WORKDIR /workspace

# 創建啟動腳本
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash"]
