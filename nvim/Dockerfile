FROM alpine:latest

# Install Python3
RUN apk add python3 python3-dev py3-pip

# Install node
RUN apk add nodejs npm

# Install git
RUN apk add git

# Install Neovim
RUN apk add neovim

# Install cURL
RUN apk add curl

# Intall Vim Plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy config       
COPY ./config /root/.config/nvim

# Install Base Plugins
RUN nvim --headless +PlugInstall +qall

# Copy Language Installer
COPY language_installer /usr/src/language_installer

# Install JavaScript
# RUN node /usr/src/language_installer/install.js javascript

# Launch nvim
CMD nvim














