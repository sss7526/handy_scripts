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

### Launch VSCode Server container
```bash
# make a directory to mount as volume
mkdir code-server

# pull the image
sudo docker pull codercom/code-server:latest

# run and name the container
sudo docker run -d --name vscode -p 8443:8080 -e AUTH="none" -v "$HOME/code-server:/home/coder" codercom/code-server:latest --auth none
```

### Launch Mattermost Team chat server/webclient
```bash
# Install dockercompose and ensure install was successfull
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Clone this git
git clone https://github.com/sss7526/handy_scripts.git

# Move to mattermost directory (THERES A YML FILE IN HERE)
cd mattermost-docker

# Make a dir and change perms on it
sudo mkdir -p ./volumes/app/mattermost ./volumes/db
sudo chown -R 2000:2000 ./volumes/app/mattermost ./volumes/db

# Run docker compose
sudo docker-compose up -d

# Access the webapp
# At http://localhost:8065
# It'll ask for you to sign up with email/pword and give your org name, but it takes anything, no real stuff required.

# From here do the nginx reverse proxy thing
```
