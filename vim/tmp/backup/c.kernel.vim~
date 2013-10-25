
set noexpandtab		" use tabs, not spaces
set tabstop=8		" tabstops of 8
set shiftwidth=8	" indents of 8
set textwidth=78	" screen in 80 columns wide, wrap at 78



set autoindent smartindent " turn on auto/smart indenting 
set smarttab		   " Make <tab> and <backspace> smarter
set backspace=eol,start,indent  " allow backspacing onver indent, eol & start



filetype plugin indent on 

map <C-j> vip=		 " forces (re)indentation of a block of code 

syntax on

syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t 
syn keyword cOperator  likely unlikely
syn keyword cType u64 u32 u16 u8 __be64 __be32 __be16 __be8  


syn match ErrorLeadSpace /^ \+/   " highlight any leading spaces 
syn match ErrorTailSpace /^ \+$/  " highlight any tailing spaces 
syn match Error80 	 /\%>80v,\+/ " highlight anything past 80 in red


if has ("gui_running")
	hi Error80 	        gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi ErrorLeadSpace 	gui=NONE guifg=#ffffff guibg=#6e2e2e
	hi ErrorTailSpace 	gui=NONE guifg=#ffffff guibg=#6e2e2e
else 
	highlight Error80		ctermfg=Blue  ctermfg=White
	highlight ErrorLeadSpace	ctermfg=Blue  ctermfg=White
	highlight ErrorTailSpace	ctermfg=Blue  ctermfg=White
endif


set formatoptions=tcqlron

set cinoptions=:0,11,t0,g0   " see :h cinoptions-values  for details

" set foldmethod=syntax

let $kernel_version=system('uname -r |tr -d "\n"')


