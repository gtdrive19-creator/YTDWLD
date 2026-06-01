FROM node:18-slim
RUN apt-get update && apt-get install -y ffmpeg python3 python3-pip
# Added the --break-system-packages flag
RUN pip3 install yt-dlp --break-system-packages
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "index.js"]
