FROM nimlang/nim:alpine

# 建立工作資料夾
WORKDIR /app

# 複製程式碼到容器中
COPY . .

# 編譯 Nitter
RUN nimble build -y

# 開放埠口
EXPOSE 8080

# 啟動服務
CMD ["./nitter"]
