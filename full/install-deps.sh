#!/usr/bin/env bash

apt-get install -y \
    doxygen \
    libffado-dev \
    libsamplerate-dev \
    libsndfile-dev \
    libasound2-dev \
    libdb-dev \
    systemd \
    libsystemd-dev \
    libpam-systemd \
    libdbus-1-dev \
    libeigen3-dev \
    libopus-dev \
    portaudio19-dev \
    locate

# remove everything that jack will provide
# (it can not be a dependency for the build)
# these files were dragged in by the above apt-get install of dependency packages
  rm -rf /usr/lib/x86_64-linux-gnu/libjack*
  rm -rf /usr/include/jack*
  rm -rf /usr/share/doc/libjack*
  rm -rf /var/lib/dpkg/info/libjack*
  rm -rf /usr/lib/x86_64-linux-gnu/pkgconfig/jack.pc
# when these files aren't deleted: jackd will behave strange after install.
# one symptom: unknown option character l

  updatedb
  echo "found these files with 'jack' in name after installing dependencies and clean up:"
  echo "========================================================================="
  locate jack | grep -v /home/travis/build
  echo "========================================================================="

  # force installation of gcc-6 if required
  if [ "${CC}" == "gcc-6" ]; then
    apt-get install gcc-6 g++-6
  fi
  # force installation of gcc-7 if required
  if [ "${CC}" == "gcc-7" ]; then
    apt-get install gcc-7 g++-7
  fi
  # force installation of gcc-8 if required
  if [ "${CC}" == "gcc-8" ]; then
    apt-get install gcc-8 g++-8
  fi
  # force installation of clang-3.8 if required
  if [ "${CC}" == "clang-3.8" ]; then
    apt-get install clang-3.8
  fi

exit 0
