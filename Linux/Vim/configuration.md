## Allow to install Plugins
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/pack/plugins/start
```
## Use prettier:

```
git clone https://github.com/prettier/vim-prettier ~/.vim/pack/plugins/start/vim-prettier
```

## Remember changes after exit:
Create a ``undodir`` file in ``~/.vim/`` and add this to your .vimrc:
```
set undodir=~/.vim/undodir
set undofile
```


## Typescript support:

Add this Plugin to your .vimrc:
```
Plug 'neoclide/coc.nvim', {'branch': 'release'}

```
Run ``:PluginInstall`` and then:

```
:CocInstall coc-json coc-tsserver
```

