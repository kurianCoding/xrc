execute pathogen#infect('bundle/{}',)
"basic setup
syntax on
filetype plugin indent on
"FOR ECLIM
if has("autocmd")
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif
setlocal completefunc=javacomplete#CompleteParamsInfo
filetype plugin on
"settings for vim notes.
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'

"settings to move text left and right
nmap <C-l> :> <CR>
nmap <C-h> :< <CR>

let g:airline_powerline_fonts = 1
"let g:airline_theme="molokai"
"let g:airline#extensions#tabline#enabled = 1
"font for the gui
set guifont=DroidSansMonoForPowerline\ Nerd\ Font\ 12
set mouse=a
"statusline
"to display the status line
set laststatus=2
"all  the status that gets displayed on status line
set statusline=%f         " path to the file
set statusline+=%=        " switch to the right side
set statusline+=%l        " current line
set statusline+=/         " separator
set statusline+=%l        " total lines
set statusline+=%{fugitive#statusline()} "for git status
"gundo settings
nnoremap <F5> :GundoToggle<CR>
"theme for vim
syntax enable
set t_Co=256
colorscheme kalisi
"colorscheme molokai
set background=dark
set cursorline
set relativenumber
set number
"ultisnips addition
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"nedrtree navigator
map <C-z> :NERDTreeToggle<CR>
imap jj <Esc>
nmap <C-x> :TagbarToggle<CR>
"custom mappings
nmap <C-a> :write<CR>
"java script completion
"let g:js_fmt_fail_silently = 1
"let g:js_fmt_autosave = 1
"let g:js_fmt_command = "jsfmt"

" A standard type: PEAR, PHPCS, PSR1, PSR2, Squiz and Zend
let g:phpfmt_standard = 'PSR2'
set shiftwidth=4
set autoindent
"let g:phpfmt_command = 'php /home/kurian/PHP_CodeSniffer/scripts/phpcbf -h'

"let g:phpfmt_autosave =0

"settings for phpfmt
"let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
"let g:phpfmt_php_path = "php"               " Path to PHP
"let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)

"vim-go plugin settings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave =1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"
"go tagbar
if !exists("g:tagbar_type_go")
    let g:tagbar_type_go = {
          \ 'ctagstype' : 'go',
          \ 'kinds'     : [
          \ 'p:package',
          \ 'i:imports',
          \ 'c:constants',
          \ 'v:variables',
          \ 't:types',
          \ 'n:interfaces',
          \ 'w:fields',
          \ 'e:embedded',
          \ 'm:methods',
          \ 'r:constructor',
          \ 'f:functions'
          \ ],
          \ 'sro' : '.',
          \ 'kind2scope' : {
          \ 't' : 'ctype',
          \ 'n' : 'ntype'
          \ },
          \ 'scope2kind' : {
          \ 'ctype' : 't',
          \ 'ntype' : 'n'
          \ },
          \ }
endif

"php tagbar
let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
  \ }

"You Complete Me settings
autocmd CompleteDone * pclose

"settings to autoformat cpp
let g:formatterpath =['/usr/local/bin/clang-format']
autocmd BufWrite *.cpp :Autoformat
autocmd BufWrite *.txt :%s/\s\+$//ge
autocmd BufWrite .vimrc :%s/\s\+$//ge
autocmd BufWrite .tmux.conf :%s/\s\+$//ge
autocmd BufWrite *.js :%s/\s\+$//ge
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType gitcommit 1|execute "normal! /\[enter\]/e+1\<CR>"

"settings for emmet-vim
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
autocmd FileType html,css EmmetInstall
"set term=builtin_ansi
if has('gui_running')
    cd  /var/www/mm-wedding-admin
    let NERDTreeWinSize=18
endif
