# Running Automatic Configuration Scripts
These setup scripts are meant for barebone setups where a Linux or MacOS machine is yet to be (fully) setup and customized with Neovim or any other related tool.
This makes it easier to install all the needed dependencies like CLang, CMake, Homebrew, unzip, etc.

## **This Neovim configuration is based on @ThePrimeagen's Neovim config with some custom edits of mine.***

## Neovim Configuration Installation &ndash; Ubuntu
1. Open a terminal and do `cd /dotfiles/scripts`
2. Then, `chmod +x install_nvim_conf.sh`
3. Run the script using `./install_nvim_conf.sh`. This will install and set up the custom Neovim configuration.

### Warning:
There may be some errors regarding on what type of system you install this on. This config is based on a Debian-based distro. If there are any issues regarding plugins, just remove them from the config or update the plugin.

## Neovim Configuration Installation &ndash; MacOS
1. Open a terminal and do `cd /dotfiles/scripts`
2. Then, `chmod +x install_nvim_conf_mac.sh`
3. Run the script using `sudo ./install_nvim_conf.sh`. This will install and set up the custom Neovim configuration using Homebrew.

# Post-Installation Setup
When you first open Neovim, you may see some errors. To resolve these errors and fully set up the configuration, follow these steps:

1. Open Neovim using the `nvim` command.
2. Inside Neovim, run `:so ~/.config/nvim/init.lua` to source the `init.lua` file (or just run ":so inside of the file").
3. Run `:so ~/.config/nvim/lua/plugins/packer.lua` to source the `packer.lua` file.
4. Run `:PackerSync` to install all of the plugins specified in `packer.lua`.
5. Run `:so` inside of all of the after/plugins .lua files to source all of the custom configs.
6. Create a .bash_aliases file in ~/ and make an alias called `alias vim='nvim'`
7. In your terminal, do `source .bashrc`
