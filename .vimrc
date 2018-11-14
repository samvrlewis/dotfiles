set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set tagrelative
let g:jedi#popup_on_dot = 0
:syntax on
:set incsearch
:set hlsearch
:map <up> gk
:map <down> gj
:command Vimrc vsp ~/.vimrc
:command NN set rnu nu
:command NONN set nornu nonu
syntax on
au FileType gitcommit set spell textwidth=72
