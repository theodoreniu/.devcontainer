FROM ubuntu:latest

# install python3 and dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-full \
    nodejs \
    npm \
    zsh \
    git \
    wget \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# install pnpm
RUN npm install -g pnpm

# Prevents potential interactive prompts during package installations
ARG DEBIAN_FRONTEND=noninteractive

# Set the default shell to zsh for the container
SHELL ["/bin/zsh", "-c"]

# Install Oh My Zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Define a custom theme or plugins (Optional)
# You can do this by modifying ~/.zshrc here, for simplicity, we copy a pre-defined .zshrc
COPY .zshrc /root/.zshrc

# Set a default zsh theme or plugins in .zshrc (Optional)
# RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# Change the default shell to zsh
RUN chsh -s $(which zsh)

# Use Zsh as the default shell when starting a container instance
CMD ["zsh"]
