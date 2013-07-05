Installation:

```Bash
git clone git@github.com:darkofabijan/vim-web-dev.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc
```

In vim run <code>:BundleInstall</code> to install the plugins.

Setting up snippets:

```Bash
cd ~/.vim/bundle/snipmate-snippets && rake deploy_local
```
