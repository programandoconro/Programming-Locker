### ohMyZsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Autosuggestions and highlighting
```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

### Configuration:

Using ``vim .zshrc`` you can set ``ZSH_THEME="avit"`` and add this plugins:

```
 plugins=(
     git
     npm
     zsh-autosuggestions
     zsh-syntax-highlighting   
     )

```

### Set the changes:

```
source .zshrc
```
