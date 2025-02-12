# MacOS Workstation Setup

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install ansible
git clone https://github.com/lstwn/mac-workstation.git
ansible-galaxy install -r requirements.yml
ansible-playbook mac-workstation.yml --ask-become-pass --ask-vault-pass
```
