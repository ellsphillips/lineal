root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
	@just --list --unsorted

# Compile every fixture, verify rejected inputs and compile the demo
check:
    ./scripts/check

# Alias for the full check suite
test: check

# Generate the demo slide deck
demo:
    typst compile --root . demo/main.typ demo/main.pdf

# Stage distributable sources in a new or empty directory
package destination:
    ./scripts/package "{{destination}}"

# Install the current version as @local/lineal, replacing that local version
install:
    ./scripts/package --install-local --replace

# Run the same checks as CI
ci: check
