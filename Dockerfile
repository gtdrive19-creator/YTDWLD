FROM node:18-slim

# Install yt-dlp and ffmpeg
RUN apt-get update && apt-get install -y ffmpeg python3 python3-pip \
  && pip3 install yt-dlp \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY YT/ .

RUN npm install

CMD ["node", "index.js"]
