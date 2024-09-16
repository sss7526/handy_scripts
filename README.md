# Handy Scripts
Handy utility scripts and commands I use in Ubuntu VMs

### Docker install/uninstall scripts

Docker fresh install:

```
./docker_install.sh
```

Docker clean uninstall

```
./docker_uninstall.sh
```

### Ubuntu custom config

Apply fresh updates, removes telemetry programs, apps I don't want, and installs apps I do want. Applies to fresh ubuntu VM install to set up dev environment the way i like it.

```
./initapt.sh
```

### Setup Rust Dev Environment

Sets up rust dev environment

```
cd rust_maker
make install
```

Additional commands for rust_maker:
```
make help
Usage:
  make install   - Install Rust and set up environment
  make update    - Update Rust and related tools
  make uninstall - Uninstall Rust and clean up environment
  make install-tools    - Install useful Rust tools (cargo-edit, cargo-watch, cargo-update)
  make help      - Show this help message
```

# Handy Commands

### Launch Open-WebUI container instance locally with OpenAI API key
```
docker run -d -p 3000:8080 -e OPENAI_API_KEY=your_secret_key -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

### Fix VirtualBox bidirectional clipboard when it stops working
```
pkill -f VBoxClient; VBoxClient --clipboard
```

### Launch Whoogle instance
```
sudo docker pull benbusby/whoogle-search
sudo docker run -d --name whoogle --network="host" benbusby/whoogle-search
```
