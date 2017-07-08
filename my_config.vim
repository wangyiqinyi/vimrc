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
set t_Co=256
let g:molokai_original=1
let g:rehash256 = 1
colorscheme molokai
" Location List Window
autocmd FileType python nmap <buffer> <cr> <cr>:lcl<cr>

" Fold
set foldmethod=marker
set foldlevelstart=20
set foldcolumn=1
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf
" nnoremap <silent> <a-1> zM <CR>
" for i in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
"     execute("nnoremap <silient> <a-" . i . "> foldlevel(" . i . ") <cr>")
" endfor

" Tab
map H :tabp <CR>
map L :tabn <CR>

" <F1, F2, ...>
map <F2> :TagbarToggle <CR>
map <F5> :call FastRun() <CR>
function! FastRun()
    let filepath = 'fast_run'
    for ext in ['.bat', '.sh']
        let file = filepath . ext
        if filereadable(file)
            silent execute '!' . file
            break
        endif
    endfor
endfunction

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

""""""""""""""""""""""""""""""
" => vim-easytags plugin
""""""""""""""""""""""""""""""
let g:easytags_updatetime_min=1000000

""""""""""""""""""""""""""""""
" => lightline plugin
""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'relativepath', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['relativepath', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

""""""""""""""""""""""""""""""
" => ctrlp plugin
""""""""""""""""""""""""""""""
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_by_filename=1
let g:ctrlp_use_caching=1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:5,results:5'
let g:ctrlp_cache_dir = $VIMEXTEND.'/ctrlp_cache'
