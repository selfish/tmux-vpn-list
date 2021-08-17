# Tmux VPN List
Simple plugin to show Tunnelblick active VPNs in Tmux.

Adds `#{vpn_list}` format.

Currently only works on OSX with ZSH.
Contributions are welcome.

## Installation
### Using [TPM](https://github.com/tmux-plugins/tpm):

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'selfish/tmux-vpn-list'

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:
```shell
git clone https://github.com/selfish/tmux-vpn-list ~/clone/path
```

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/vpn.tmux

From the terminal, reload TMUX environment:
```shell
tmux source-file ~/.tmux.conf
```

## Usage
Add `#{vpn_list}` format string to your existing status.

Example:
```shell
set -g status-right "VPN: #{vpn_list} | %a %h-%d %H:%M "
```
    
