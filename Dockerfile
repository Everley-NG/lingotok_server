# 使用 Python 官方基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 将当前目录下的代码复制到容器中
COPY . .

# 安装依赖
# RUN apt-get update && apt-get install -y ffmpeg
RUN pip install --no-cache-dir -r requirements.txt

# 暴露端口
EXPOSE 5000

# 启动服务
#CMD ["python", "recommender_server.py"]
CMD ["uvicorn", "recommender_fastapi_server:app", "--host", "0.0.0.0", "--port", "5000", "--workers", "8"]