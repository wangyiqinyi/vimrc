let $VIMEXTEND=expand('<sfile>:p:h')
set runtimepath+=$VIMEXTEND

source $VIMEXTEND/vimrcs/basic.vim
source $VIMEXTEND/vimrcs/filetypes.vim
source $VIMEXTEND/vimrcs/plugins_config.vim
source $VIMEXTEND/vimrcs/extended.vim

set number

""""""""""""""""""""""""""""""
" => vim-session plugin
""""""""""""""""""""""""""""""
let g:session_autosave='yes'
let g:session_autosave_periodic=1
let g:session_lock_enabled=1
