.PHONY: help info net-bench clean ssl

help:
	@echo "Available targets:"
	@echo "  make info       - Run full system & hardware diagnostics"
	@echo "  make net-bench  - Profile DNS and HTTP network latency"
	@echo "  make clean      - Prune unused Docker images, volumes, and caches"
	@echo "  make ssl        - Check TLS certificate expiry (DOMAIN=example.com)"

info:
	@bash scripts/sysinfo.sh

net-bench:
	@bash scripts/net-bench.sh https://api.github.com

clean:
	@bash scripts/docker-cleanup.sh

ssl:
	@bash scripts/ssl-check.sh $(DOMAIN)
