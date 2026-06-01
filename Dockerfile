FROM node:18-slim
RUN apt-get update && apt-get install -y ffmpeg python3 python3-pip
RUN pip3 install yt-dlp
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "index.js"]