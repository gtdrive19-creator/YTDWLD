WORKDIR /app
COPY . .
# Add this line to debug the directory contents during build
RUN ls -la 
RUN npm install
CMD ["node", "index.js"]
