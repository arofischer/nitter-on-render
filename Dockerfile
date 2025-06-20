FROM alpine:3.19

# 安裝依賴與 curl
RUN apk add --no-cache git build-base curl gcc g++

# 安裝 choosenim（用來安裝 Nim）
RUN curl -O https://nim-lang.org/choosenim/init.sh \
    && sh init.sh -y

# 設定 PATH（讓 nimble 可用）
ENV PATH=/root/.nimble/bin:/root/.choosenim:/root/.nimble/bin:$PATH

# 建立工作目錄
WORKDIR /app

# 複製專案到容器
COPY . .

# 使用 nimble 編譯
RUN nimble build -y

# 開放 8080 埠
EXPOSE 8080

# 啟動服務
CMD ["./nitter"]
