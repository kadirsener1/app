FROM python:3.10-slim

# FFmpeg ve gerekli sistem araçlarını kur
RUN apt-get update && apt-get install -y \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizinini ayarla
WORKDIR /app

# Önce requirements.txt'yi kopyala (cache için)
COPY requirements.txt .

# Python bağımlılıklarını kur
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama kodunu kopyala
COPY . .

# Railway PORT değişkenini otomatik kullanır, ekstra ayar gerekmez
CMD ["python", "main.py"]
