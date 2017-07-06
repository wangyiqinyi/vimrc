if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

let $VIMEXTEND=expand('<sfile>:p:h')
set runtimepath+=$VIMEXTEND

source $VIMEXTEND/vimrcs/basic.vim
source $VIMEXTEND/vimrcs/filetypes.vim
source $VIMEXTEND/vimrcs/plugins_config.vim
source $VIMEXTEND/vimrcs/extended.vim
source $VIMEXTEND/sources_non_forked/ack.vim/plugin/ack.vim

set number
set wfh
set wfw

""""""""""""""""""""""""""""""
" => vim-session plugin
""""""""""""""""""""""""""""""
let g:session_autosave='yes'
let g:session_autosave_periodic=1
let g:session_lock_enabled=1
let g:session_autoload='yes'

""""""""""""""""""""""""""""""
" => vim-grepper plugin
""""""""""""""""""""""""""""""
nnoremap <leader>ag :Grepper -tool ag -open -highlight -switch -cword -noprompt -stop 1000<cr>

