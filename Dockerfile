FROM debian:bullseye-slim

# 必要な依存パッケージをインストール（Godot実行に必要な最低限）
RUN apt-get update && apt-get install -y \
    libx11-6 \
    libxcursor1 \
    libxrandr2 \
    libxi6 \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ
WORKDIR /app

# サーバーファイルをコピー
COPY server.x86_64 .
COPY server.pck .
COPY start.sh .

RUN chmod +x start.sh

# RailwayのPORT環境変数を使ってENetのポートにマッピング
EXPOSE 12345

# 起動コマンド
CMD ["./start.sh"]
