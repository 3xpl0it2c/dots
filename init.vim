call plug#begin(stdpath('data') . '/plugged')

" AutoComplete, Lint, etc..
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" General
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'

" Visuals
Plug 'itchyny/lightline.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'junegunn/seoul256.vim'

call plug#end()

filetype plugin on

set number
set ruler
set hidden
set noshowmode
set termguicolors
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.out
set wildignore+=node_modules/*,dist/*
set signcolumn=yes
let mapleader = ','

let g:material_theme_style = 'ocean'
let g:material_terminal_italics = 1
let g:seoul256_srgb = 1
let g:seoul256_background = 233

colorscheme material

nnoremap <C-t> :tabnew<CR>

" Conquer Of Completion . NeoVIM
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nmap <F2> <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Lightline.
let g:lightline = { 'colorscheme': 'material_vim' }

" ALE
let g:ale_fix_on_save = 1
let g:ale_fixers = {
			\'*': ['remove_trailing_lines', 'trim_whitespace'],
			\'javascript': ['prettier', 'eslint'],
			\'typescript': ['prettier', 'eslint'],
			\'rust':       ['rustfmt']
			\}

" CtrlP
nnoremap <C-Space> :CtrlP<CR>
