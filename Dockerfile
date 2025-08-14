FROM nvidia/cuda:12.4.0-devel-ubuntu22.04
RUN apt update && apt install -y git software-properties-common python3-launchpadlib python3.10 python3-pip curl
RUN curl -O https://github.com/egorovivannn/decord_image/raw/refs/heads/main/cuda_files/libnvcuvid.so && mv libnvcuvid.so /usr/local/cuda/lib64/stubs

COPY ./requirements.txt /requirements.txt
RUN python3.10 -m pip install --no-cache-dir -r /requirements.txt

# install decord
RUN add-apt-repository -y ppa:jonathonf/ffmpeg-4 && apt update
RUN apt install -y build-essential python3-dev python3-setuptools make cmake
RUN apt install -y ffmpeg libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev
RUN git clone --recursive https://github.com/dmlc/decord /decord; mkdir -p /decord/build
WORKDIR /decord/build
RUN cmake .. -DUSE_CUDA=0 -DCMAKE_BUILD_TYPE=Release
RUN make

CMD ["bash"]