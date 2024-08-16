# 使用官方 Node.js LTS 版本作为基础镜像
FROM node:18-slim

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 yarn.lock 以进行依赖安装
COPY package.json yarn.lock ./

# 安装项目依赖项
RUN yarn install --frozen-lockfile

# 复制项目文件到工作目录
COPY . .

# 暴露开发服务器的端口（默认情况下，Vite 使用 5173 端口）
EXPOSE 3001

# 命令选项：
# 1. 启动开发服务器
# 2. 构建项目并进行预览
# 3. 代码风格检查
# 4. 代码格式修复

# 启动开发服务器
CMD ["yarn", "dev"]

# 如果你想默认运行其他命令，比如构建和预览，你可以注释掉上面的 CMD，并取消下面的注释：
# CMD ["yarn", "build", "&&", "yarn", "preview"]

# 或者如果你想运行 lint 检查或修复格式：
# CMD ["yarn", "lint"]
# CMD ["yarn", "format"]
