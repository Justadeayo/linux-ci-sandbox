# Linux CI & Automation Sandbox

A personal lab environment for testing bash automation scripts, evaluating CI runner performance, and managing system administration configurations.

## Structure

- **`.github/workflows/`**: Automated CI pipelines for system health checks and benchmark testing.
- **`scripts/`**: Reusable utility scripts for system diagnostics, network latency profiling, and backup rotation.
- **`configs/`**: Personal configuration snippets for terminal multiplexers and shell environments.

## Usage

All scripts are written in POSIX-compliant Bash and can be executed locally or invoked via GitHub Actions workflows:

```bash
# Run system diagnostics
bash scripts/sysinfo.sh

# Profile network throughput
bash scripts/net-bench.sh [https://api.github.com](https://api.github.com)
