FROM node:24.0.1-bullseye

# Update repositori dan install dependensi sistem
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Set direktori kerja
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package.json ./
COPY package-lock.json* ./

# Install dependensi Node.js
RUN npm install

# Salin semua file ke container
COPY . .

# Buka port 5000
EXPOSE 5000

# Jalankan aplikasi
CMD ["node", "dist/1ab6d9b8bf153ea0.js", "--autoread"]
