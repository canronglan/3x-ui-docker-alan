# ========================================================
# Stage: Final Image of 3x-ui-alan
# ========================================================
FROM ghcr.io/mhsanaei/3x-ui:latest
ENV TZ=Asia/Shanghai
WORKDIR /app
COPY . .
RUN chmod +x /app/DockerEntrypoint.sh
ENTRYPOINT [ "/app/DockerEntrypoint.sh" ]
