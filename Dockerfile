FROM python:3.14.2-slim-bookworm
COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/
RUN uv pip install certpatrol certpatrol-orchestrator --system
ENTRYPOINT ["/usr/local/bin/certpatrol-orch", "server", "-f", "/data/certpatrol.sqlite", "--debug"]
