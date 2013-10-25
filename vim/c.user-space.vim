" Vim indent file
" Language:	C++
" Maintainer:	Konstantin Lepa <konstantin.lepa@gmail.com>
" Last Change:	2010 May 20
" License: MIT
" Version: 1.1.0
"
" Changes {{{
" 1.1.0 2011-01-17
"   Refactored source code.
"   Some fixes.
"
" 1.0.1 2010-05-20
"   Added some changes. Thanks to Eric Rannaud <eric.rannaud@gmail.com>
"
"}}}

setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab
setlocal textwidth=79
setlocal wrap

setlocal cindent
setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

" set list
" setlocal spell spelllang=en_us
