#!/usr/bin/env python3
"""
context-kit MCP server — exposes your PCA files as MCP resources.

Supports any MCP-compatible client (Claude Desktop, Continue, etc.).
No dependencies beyond the Python standard library.

Usage (Claude Desktop — add to claude_desktop_config.json):
  {
    "mcpServers": {
      "context-kit": {
        "command": "python3",
        "args": ["/path/to/context-kit/mcp_server.py"]
      }
    }
  }

Or with uvx (if published to PyPI):
  "command": "uvx", "args": ["context-kit-mcp"]
"""
import json
import sys
from pathlib import Path

CONTEXT_DIR = Path.home() / ".claude" / "context"
SERVER_NAME = "context-kit"
SERVER_VERSION = "0.1.0"
PROTOCOL_VERSION = "2024-11-05"

PCA_FILES = [
    ("pca-wiki.md", "PCA: Who I Am", "Personal background, roles, goals, projects, and relationships"),
    ("pca-mental-models.md", "PCA: How I Decide", "Decision frameworks, money/time/risk priors"),
    ("pca-voice.md", "PCA: How I Write", "Writing style examples, anti-examples, channel rules"),
    ("pca-protocols.md", "PCA: My Rules", "Non-negotiables, hard constraints, protocols"),
    ("domain-state.md", "Domain State", "Per-domain project state template"),
]


def send(obj):
    sys.stdout.write(json.dumps(obj) + "\n")
    sys.stdout.flush()


def respond(id, result):
    send({"jsonrpc": "2.0", "id": id, "result": result})


def error(id, code, message):
    send({"jsonrpc": "2.0", "id": id, "error": {"code": code, "message": message}})


def handle(req):
    method = req.get("method", "")
    id = req.get("id")
    params = req.get("params") or {}

    if method == "initialize":
        respond(id, {
            "protocolVersion": PROTOCOL_VERSION,
            "capabilities": {
                "resources": {"subscribe": False, "listChanged": False},
            },
            "serverInfo": {"name": SERVER_NAME, "version": SERVER_VERSION},
            "instructions": (
                "This server exposes your Personal Context Artifacts (PCA files) "
                "from ~/.claude/context/. Fill in these files to give any AI agent "
                "persistent context about who you are, how you decide, how you write, "
                "and your non-negotiables."
            ),
        })

    elif method == "notifications/initialized":
        pass  # no response

    elif method == "resources/list":
        resources = []
        for fname, name, description in PCA_FILES:
            path = CONTEXT_DIR / fname
            if path.exists():
                resources.append({
                    "uri": f"file://{path}",
                    "name": name,
                    "description": description,
                    "mimeType": "text/markdown",
                })
        respond(id, {"resources": resources})

    elif method == "resources/read":
        uri = params.get("uri", "")
        if not uri.startswith("file://"):
            error(id, -32602, "Only file:// URIs supported")
            return
        path = Path(uri[7:])
        if not path.exists():
            error(id, -32002, f"Resource not found: {uri}")
            return
        if not str(path).startswith(str(CONTEXT_DIR)):
            error(id, -32602, "Access denied: path outside context directory")
            return
        content = path.read_text(encoding="utf-8")
        respond(id, {
            "contents": [{
                "uri": uri,
                "mimeType": "text/markdown",
                "text": content,
            }]
        })

    elif method == "ping":
        respond(id, {})

    else:
        if id is not None:
            error(id, -32601, f"Method not found: {method}")


def main():
    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue
        try:
            req = json.loads(line)
            handle(req)
        except json.JSONDecodeError as e:
            sys.stderr.write(f"JSON error: {e}\n")
        except Exception as e:
            sys.stderr.write(f"Error handling request: {e}\n")


if __name__ == "__main__":
    main()
