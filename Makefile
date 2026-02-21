.PHONY: new audit

# Usage: make new NAME=mytool DESC="Does something useful"
new:
	@[ -n "$(NAME)" ] || (echo "Usage: make new NAME=mytool DESC=\"description\""; exit 1)
	@[ -n "$(DESC)" ] || (echo "Usage: make new NAME=mytool DESC=\"description\""; exit 1)
	./scripts/new-rust-project.sh "$(NAME)" "$(DESC)"

audit:
	brew audit Formula/*.rb
