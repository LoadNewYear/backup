" Set compatibility to vim only
set nocompatible

" Show line number
set relativenumber

" Show status bar
set laststatus

" Turn on syntax highlighting
syntax on

" Faster rendering
set ttyfast

" Show the current command
set showcmd

" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()

" Remaps
let mapleader = " "

" 	Open netrw
nnoremap <leader>pv :Ex<CR>

" 	Move around lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" 	Not make me nauseous
nnoremap n nzzzv
nnoremap N Nzzzv

" 	FZF
nnoremap <leader>pf :Files<CR>

" 	Switch to another project
nnoremap <C-f> <cmd>silent !tmux neww tmux-sessionizer<CR>

" 	Word replace throughout whole file
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

"	Buffers
nnoremap <leader>bv :Buffers<CR> 


" Markdown
" Enable folding.
let g:vim_markdown_folding_disabled = 0

" Fold heading in with the contents.
let g:vim_markdown_folding_style_pythonic = 1

" Don't use the shipped key bindings.
let g:vim_markdown_no_default_key_mappings = 1

" Autoshrink TOCs.
let g:vim_markdown_toc_autofit = 1

" Indentation for new lists. We don't insert bullets as it doesn't play
" nicely with `gq` formatting. It relies on a hack of treating bullets
" as comment characters.
" See https://github.com/plasticboy/vim-markdown/issues/232
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0

" Filetype names and aliases for fenced code blocks.
let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']

" Highlight front matter (useful for Hugo posts).
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_frontmatter = 1

" Format strike-through text (wrapped in `~~`).
let g:vim_markdown_strikethrough = 1
