FROM alpine:latest

# 安装必要的工具
RUN apk add --no-cache curl tar

# 设置工作目录
WORKDIR /app

# 下载并解压目标文件
RUN curl -L -o vnts.tar.gz https://github.com/vnt-dev/vnts/releases/download/v1.2.12/vnts-x86_64-unknown-linux-musl-v1.2.12.tar.gz && \
    tar -xzf vnts.tar.gz && \
    rm vnts.tar.gz

# 给 vnts 执行文件赋予执行权限
RUN chmod +x /app/vnts

# 默认执行 vnts
CMD ["./vnts"]