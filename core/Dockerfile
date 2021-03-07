# Copyright (c) Microsoft Corporation. All rights reserved. {{{1
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.

# Copyright (c) it4fi. All rights reserved. {{{1
# Licensed under the MIT License: https://opensource.org/licenses/MIT

# Use the default ubuntu image {{{1
FROM ubuntu

# Avoid warnings by switching to noninteractive {{{1
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages {{{1
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt-get -y install git iproute2 procps lsb-release

# Add test tool chain {{{1
# NOTE: newer version of the compilers are not
#    provided by stock distributions
#    and are provided by the /test toolchain
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get update

# Install common compilation tools {{{1
RUN apt-get -y install git build-essential pkg-config autoconf automake libtool \
 bison flex libpq-dev parallel libunwind-dev

# Update compiler tools {{{1
RUN apt-get -y install gcc-7 g++-7 cpp-7 libstdc++-7-dev
ENV CC=gcc-7
ENV CXX=g++-7

# Install postgresql to enable tests under make check {{{1
RUN apt-get -y install postgresql

# Set up locale {{{1
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Switch back to dialog for any ad-hoc use of apt-get {{{1
ENV DEBIAN_FRONTEND=
