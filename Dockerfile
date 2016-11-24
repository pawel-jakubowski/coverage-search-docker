FROM ubuntu:16.04

# Install needed packages
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    llvm clang build-essential \
    libgsl-dev \
    libfreeimage-dev libfreeimageplus-dev \
    libqt4-dev \
    freeglut3-dev \
    libxi-dev \
    libxmu-dev \
    liblua5.2-dev lua5.2 \
    doxygen \
    graphviz graphviz-dev \
    asciidoc

# Create repo directory
ENV REPODIR /home/pjakubow/coverage-search
RUN mkdir -p $REPODIR
WORKDIR $REPODIR

# Download repo
RUN git clone --recursive https://github.com/pawel-jakubowski/coverage-search.git $REPODIR

# Set build dir
ENV BUILDDIR $REPODIR/build
RUN mkdir -p $BUILDDIR
WORKDIR $BUILDDIR

# Set compiler
ENV CC /usr/bin/clang
ENV CXX /usr/bin/clang++

