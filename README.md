# homebrew-tap

Homebrew tap for [@cahyasetya](https://github.com/cahyasetya)'s tools.

## Install

```sh
brew tap cahyasetya/tap
```

## Tools

| Tool | Description | Install |
|------|-------------|---------|
| [cdu](https://github.com/cahyasetya/cdu) | Interactive TUI disk usage viewer | `brew install cahyasetya/tap/cdu` |
| [snip](https://github.com/cahyasetya/snip) | Save and re-run shell commands with an interactive picker | `brew install cahyasetya/tap/snip` |

## Adding a new Rust project

This repo includes a bootstrap script and a reusable release workflow to make it easy to set up new Rust CLI projects with Homebrew distribution.

### Prerequisites

- [`gh`](https://cli.github.com/) CLI installed and authenticated
- `HOMEBREW_TAP_TOKEN` — a GitHub PAT with write access to this repo, set as an environment variable

```sh
export HOMEBREW_TAP_TOKEN=ghp_...
```

### Create a new project

```sh
./scripts/new-rust-project.sh <binary-name> "<description>" [--private]
```

**Example:**

```sh
./scripts/new-rust-project.sh mytool "Does something useful"
```

This will:
1. Create and clone the GitHub repo
2. Initialize a Cargo project
3. Add `cargo-release.yml` and `release.yml` workflows
4. Add a `Makefile` with common dev tasks
5. Set the `HOMEBREW_TAP_TOKEN` secret on the new repo
6. Push the initial commit

### Development workflow

```sh
make build          # cargo build
make run            # cargo run
make test           # cargo test
make install        # cargo install --path .
make release-patch  # bump patch version and trigger CI release
make release-minor  # bump minor version and trigger CI release
make release-major  # bump major version and trigger CI release
```

### How releases work

1. `make release-patch` triggers the `cargo-release.yml` workflow, which bumps the version in `Cargo.toml` and pushes a `v*` tag
2. The tag push triggers `release.yml`, which calls the reusable workflow in this repo (`.github/workflows/release.yml`)
3. The reusable workflow builds binaries for macOS (arm64, x86_64) and Linux (x86_64), packages them as `.tar.gz`, uploads them to the GitHub Release, then updates the formula in this repo automatically
