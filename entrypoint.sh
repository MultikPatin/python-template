#!/usr/bin/env bash
set -e
if [ -z "$API_LOG_LEVEL" ]; then
  API_LOG_LEVEL=info
fi
if [ -z "$API_PORT" ]; then
  API_PORT=8000
fi

uv run uvicorn src.composites.storage:app --host 0.0.0.0 --port $API_PORT --log-level $API_LOG_LEVEL --proxy-headers --forwarded-allow-ips '*'
