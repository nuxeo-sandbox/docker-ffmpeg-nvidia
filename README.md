## Description
A docker image to run ffmpeg with nvidia gpu hardware acceleration

## Important Note

**These features are not part of the Nuxeo Production platform.**

These solutions are provided for inspiration and we encourage customers to use them as code samples and learning resources.

This is a moving project (no API maintenance, no deprecation process, etc.) If any of these solutions are found to be useful for the Nuxeo Platform in general, they will be integrated directly into platform, not maintained here.

## Requirements (AWS)
* Start a ubuntu 16.04 g2 instance on aws
* Install the nvidia driver [documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-nvidia-driver.html)
* Install Docker [documentation](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
* Install Docker Engine Utility for NVIDIA GPUs [documentation](https://github.com/NVIDIA/nvidia-docker)

## How to build
```
git clone https://github.com/nuxeo-sandbox/docker-ffmpeg-nvidia
cd docker-ffmpeg-nvidia
sudo docker build . -t ffmpeg-nvidia
```

## Run
```
sudo docker run --runtime=nvidia -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,video -v $(pwd):/tmp/content --rm ffmpeg-nvidia ffmpeg -y -vsync 0 -hwaccel cuvid -i "/tmp/content/input.mp4" -filter:v hwupload_cuda,scale_npp=w=576:h=480:format=yuv420p:interp_algo=lanczos,hwdownload,format=yuv420p  -c:a copy -c:v h264_nvenc -b:v 5M /tmp/content/output.mp4
```

## Known limitations
This is a work in progress.

## Resources
https://developer.nvidia.com/designworks/dl/Using_FFmpeg_with_NVIDIA_GPU_Hardware_Acceleration-pdf (requires a free developer account)

## About Nuxeo
Nuxeo dramatically improves how content-based applications are built, managed and deployed, making customers more agile, innovative and successful. Nuxeo provides a next generation, enterprise ready platform for building traditional and cutting-edge content oriented applications. Combining a powerful application development environment with SaaS-based tools and a modular architecture, the Nuxeo Platform and Products provide clear business value to some of the most recognizable brands including Verizon, Electronic Arts, Netflix, Sharp, FICO, the U.S. Navy, and Boeing. Nuxeo is headquartered in New York and Paris. More information is available at [www.nuxeo.com](http://www.nuxeo.com).
