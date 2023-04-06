#!/bin/bash

# Clone the dotfiles repository
if ! git clone https://github.com/diegoandino/dotfiles.git ~/dotfiles; then
	    echo "Failed to clone dotfiles repository" >&2
		    exit 1
fi

# Copy the nvim directory to .config
if ! cp -r ~/dotfiles/nvim ~/.config/; then
	    echo "Failed to copy nvim directory to ~/.config" >&2
		    exit 1
fi

# Clone neovim from source
if ! git clone https://github.com/neovim/neovim.git ~/neovim; then
	    echo "Failed to clone neovim repository" >&2
		    exit 1
fi

if ! sudo apt install -y clang cmake; then
	    echo "Failed to install Clang and CMake" >&2
		    exit 1
fi

# Build neovim from source
if ! cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo; then
	    echo "Failed to build neovim" >&2
		    exit 1
fi

# Install neovim
if ! sudo make install; then
	    echo "Failed to install neovim" >&2
		    exit 1
fi

# Clone the Packer plugin for neovim
if ! git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim; then
	    echo "Failed to clone Packer repository" >&2
		    exit 1
fi

echo "All steps completed successfully"
