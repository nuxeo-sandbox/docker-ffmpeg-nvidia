FROM nvidia/cuda:8.0-devel

WORKDIR /tmp

ADD build-ffmpeg.sh build-ffmpeg.sh
RUN chmod +x build-ffmpeg.sh

RUN apt-get update && apt-get install -y git build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev frei0r-plugins-dev libgnutls28-dev libass-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libopenjpeg-dev libopus-dev librtmp-dev libsoxr-dev libspeex-dev libtheora-dev libvo-amrwbenc-dev libvorbis-dev libvpx-dev libwebp-dev libx264-dev libx265-dev libxvidcore-dev

RUN ./build-ffmpeg.sh
