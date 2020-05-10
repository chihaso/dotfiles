
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" " Dein.vim
" if &compatible
"   set nocompatible
" endif
" " Add the dein installation directory into runtimepath
" set runtimepath+=~/.vim/Bundles/repos/github.com/Shougo/dein.vim

" if dein#load_state('~/.cache/dein')
"   call dein#begin('~/.cache/dein')
"
"   call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
"   call dein#add('Shougo/deoplete.nvim')
"   if !has('nvim')
"     call dein#add('roxma/nvim-yarp')
"     call dein#add('roxma/vim-hug-neovim-rpc')
"   endif
"
"   " tomlファイル（使用するプラグインのリストが記述されているファイル）の場所を指定
"   let g:rc_dir = expand('~/.cache/dein') "<- dein.toml dein_lazy.toml を読み込むディレクトリ ##########
"   let s:toml = g:rc_dir . '/dein.toml'
"   " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml' "<- dein_lazy.toml を使う場合はコメント解除 ##########
"
"   " tomlファイルを読み込む
"   call dein#load_toml(s:toml, {'lazy': 0})
"   " call dein#load_toml(s:lazy_toml, {'lazy': 1}) "<- dein_lazy.toml を使う場合はコメント解除 ##########
"
"   let g:ale_fixers = {
"   \   'ruby': ['rubocop'],
"   \}
"
"   call dein#end()
"   call dein#save_state()
" endif

filetype plugin indent on
syntax enable

" 自分で書いた
set backupdir=/Users/yuta/.vim/Backup
set undodir=/Users/yuta/.vim/Undo

syntax on
set number
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
