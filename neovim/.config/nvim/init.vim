" Base init.vim to direct to either VS Code or regular vim configuration
if exists('g:vscode')
    source ~/.config/nvim/init_vscode.vim
else
    echo "vscode not detected. loading fancy stuff as well"
    source ~/.config/nvim/init_regular.vim
endif
