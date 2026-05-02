# dotfiles

# Neovim Launch Aliases

The following shell aliases allow you to run multiple independent Neovim configurations:

```bash
alias vimch="NVIM_APPNAME=nvimch nvim"
alias vv="NVIM_APPNAME=zxz $HOME/.bin/nvim-linux-x86_64/bin/nvim"
```

How they work
- vimch – Launches Neovim with a custom configuration name nvimch.
Neovim will read/write config and data from ~/.config/nvimch/, ~/.local/share/nvimch/, etc., instead of the default paths (~/.config/nvim/).
This is useful for testing different setups, maintaining versioned configs, or isolating plugins.

- vv – Sets NVIM_APPNAME=zxz and runs a specific Neovim binary located outside the $PATH.
This lets you use a different Neovim version (e.g., a precompiled nightly or custom build) along with a separate config directory (zxz).
The config lives under ~/.config/zxz/, while the binary is explicitly pointed to $HOME/.bin/nvim-linux-x86_64/bin/nvim.

## Why use NVIM_APPNAME?

Normally Neovim uses ~/.config/nvim/. By setting NVIM_APPNAME=<name> you redirect it to ~/.config/<name>/. This allows:

Side‑by‑side configurations (e.g., nvimch for LazyVim, zxz for kickstart.nvim)
Isolated plugin installations and states
Testing without breaking your main setup

---

# SSH Config Setup Guide

The `~/.ssh/config` file allows you to define connection rules for different hosts, making SSH and Git operations much cleaner and more organized.

## Basic Configuration Example

```ssh-config
# GITHUB
Host github.com
  HostName github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/file.key

# GITLAB
Host gitlab.com
   HostName gitlab.com
   PreferredAuthentications publickey
   IdentityFile ~/.ssh/file.key
```

## Detailed Parameter Explanation

Parameter                   | Description
Host                        | The alias or hostname you'll type (e.g., ssh github.com)
HostName                    | The actual server domain name or IP address
PreferredAuthentications    | Authentication method order. publickey tries SSH keys first before falling back to passwords
IdentityFile                | Critical: Path to your private key file (e.g., ~/.ssh/id_ed25519), not the public key (.pub)


## Multiple Key Example

```ssh-config
# Personal GitHub
Host github.com
  HostName github.com
  User git
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_personal

# Work GitLab
Host gitlab.com
  HostName gitlab.com
  User git
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_work

# Internal server with custom port
Host myserver
  HostName 192.168.1.100
  Port 2222
  User admin
  IdentityFile ~/.ssh/id_rsa_internal
```

## Useful Additional Options

```ssh-config
Host example
  HostName example.com
  User myusername
  Port 2222                    # non-default SSH port
  IdentitiesOnly yes           # only use keys specified in IdentityFile
  LogLevel VERBOSE             # helpful for debugging
  ServerAliveInterval 60       # keep connection alive
```

## Setting Up Correct Permissions

```Bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config
chmod 600 ~/.ssh/id_*           # private keys
chmod 644 ~/.ssh/*.pub          # public keys can be world-readable
```

## Testing Your Configuration

```Bash
# Test GitHub connection
ssh -T git@github.com

# Test with verbose output (great for debugging)
ssh -Tv git@github.com

# Test a custom host alias
ssh myserver
```
---
