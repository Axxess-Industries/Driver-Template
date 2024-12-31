FROM python:3.10

# Set environment variables
ENV LUAROCKS_VERSION=3.11.1

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    libreadline-dev \
    unzip \
    libssl-dev \
    && apt-get clean

# Make sure pip is installed.
RUN python3 -m ensurepip

RUN apt-get install -y python3-dev
RUN apt-get install -y swig
RUN apt-get install -y xmlstarlet
RUN pip install m2crypto
RUN pip install lxml

# Install LuaJIT
RUN cd tmp && \
    git clone https://luajit.org/git/luajit.git && \
    cd luajit && \
    make && \
    make install && \
    cd /

# Add LuaJIT binary path to environment
ENV PATH="/usr/local/bin:$PATH"
ENV LUAJIT_LIB=/usr/local/lib
ENV LUAJIT_INC=/usr/local/include/luajit-2.1

# Download and install LuaRocks
RUN wget https://luarocks.org/releases/luarocks-${LUAROCKS_VERSION}.tar.gz && \
    tar zxpf luarocks-${LUAROCKS_VERSION}.tar.gz && \
    cd luarocks-${LUAROCKS_VERSION} && \
    ./configure --lua-suffix=jit --with-lua-include=${LUAJIT_INC} && \
    make && \
    make install && \
    cd .. && \
    rm -rf luarocks-${LUAROCKS_VERSION}.tar.gz luarocks-${LUAROCKS_VERSION}

# Install packages from LuaRocks
RUN luarocks install luacheck
