# 使用更轻量级的基础镜像
FROM golang:1.22-alpine AS builder

# 设置工作目录
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

# 复制代码文件
COPY . .

# 编译程序
RUN go build -o MiniPass .

# 使用更小的运行时镜像，减小镜像体积
FROM alpine:latest

# 设置运行时工作目录
WORKDIR /app

# 将编译好的二进制文件从构建阶段复制到运行时
COPY --from=builder /app/MiniPass .


# 运行程序
CMD ["./MiniPass"]
