# MacOS Workstation Setup

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible
mkdir -p ~/Projects
git clone https://github.com/lstwn/mac-workstation.git ~/Projects/mac-workstation
ansible-galaxy install -r requirements.yml
ansible-playbook mac-workstation.yml --ask-become-pass --ask-vault-pass
git clone https://github.com/lstwn/dotfiles.git ~/Projects/dotfiles
```
