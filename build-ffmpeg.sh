#!/bin/bash

git clone https://github.com/ffmpeg/ffmpeg.git
cd ffmpeg
git checkout release/3.3
./configure --enable-nonfree --disable-shared --enable-nvenc --enable-cuda --enable-cuvid --enable-libnpp --extra-cflags=-Ilocal/include --enable-gpl --enable-version3 --disable-debug --disable-ffplay --disable-indev=sndio --disable-outdev=sndio --enable-fontconfig --enable-frei0r --enable-gnutls --enable-gray --enable-libass --enable-libfreetype --enable-libfribidi --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-librtmp --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libvo-amrwbenc --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxvid --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64

make -j 8
make install
