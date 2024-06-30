# Makefile for Rust environment management

.PHONY: help install update uninstall

# Default target: show help
help:
	@echo "Usage:"
	@echo "  make install   - Install Rust and set up environment"
	@echo "  make update    - Update Rust and related tools"
	@echo "  make uninstall - Uninstall Rust and clean up environment"
	@echo "  make install-tools    - Install useful Rust tools (cargo-edit, cargo-watch, cargo-update)"
	@echo "  make help      - Show this help message"

install:
	@echo "Installing Rust and setting up environment..."
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	@source $$HOME/.cargo/env
	@echo 'source $$HOME/.cargo/env' >> $$HOME/.bashrc || echo 'source $$HOME/.cargo/env' >> $$HOME/.zshrc
	@echo "Rust installation complete."
	@rustc --version
	@cargo --version

update:
	@echo "Updating Rust and related tools..."
	@rustup update
	@cargo install-update -a
	@echo "Rust update complete."
	@rustc --version
	@cargo --version

version:
	@rustc --version
	@cargo --version

uninstall:
	@echo "Uninstalling Rust and cleaning up environment..."
	@rustup self uninstall -y
	@sed -i '/source \$\$HOME\/.cargo\/env/d' $$HOME/.bashrc
	@sed -i '/source \$\$HOME\/.cargo\/env/d' $$HOME/.zshrc
	@echo "Rust uninstallation complete."

# Optional command: install cargo-update for cargo update management
install-tools:
	@echo "Installing useful Rust tools..."
	@sudo apt update
	@sudo apt install -y pkg-config libssl-dev
	@cargo install cargo-edit
	@cargo install cargo-watch
	@cargo install cargo-update
	@echo "Tool installation complete."