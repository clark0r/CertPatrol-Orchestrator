FROM python:3.14.2-slim-bookworm

# Create non-root user
RUN useradd -m -u 10001 certpatrol

# Install uv (fast Python package manager)
COPY --from=docker.io/astral/uv:latest /uv /uvx /bin/

# Copy source
WORKDIR /app
COPY . /app

# Install dependencies and project
RUN uv pip install --system -r requirements.txt \
 && uv pip install --system certpatrol \
 && uv pip install --system -e .

# Prepare persistent data directory
RUN mkdir /data && chown certpatrol:certpatrol /data

USER certpatrol

EXPOSE 8080

ENTRYPOINT ["sh","-c","DB=/data/certpatrol.sqlite; if [ ! -f \"$DB\" ]; then certpatrol-orch init -f \"$DB\"; fi; exec certpatrol-orch server -f \"$DB\""]
