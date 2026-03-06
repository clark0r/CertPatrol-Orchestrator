FROM python:3.14.2-slim-bookworm

# Create non-root user
RUN useradd -m certpatrol

COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/

# Install application
RUN uv pip install certpatrol certpatrol-orchestrator --system

# Prepare data directory
RUN mkdir /data && chown certpatrol:certpatrol /data

USER certpatrol

ENTRYPOINT ["sh","-c","DB=/data/certpatrol.sqlite; if [ ! -f $DB ]; then certpatrol-orch init -f $DB; fi; exec certpatrol-orch server -f $DB"]


#FROM python:3.14.2-slim-bookworm
#COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/
#RUN uv pip install certpatrol certpatrol-orchestrator --system
#ENTRYPOINT ["/usr/local/bin/certpatrol-orch", "server", "-f", "/data/certpatrol.sqlite", "--debug"]
