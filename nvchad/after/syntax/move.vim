" Basic Move syntax highlighting
if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword moveKeyword module use fun struct let mut const public entry view acquires has copy drop store key
syn keyword moveType u8 u16 u32 u64 u128 u256 bool address signer vector
syn keyword moveBoolean true false
syn keyword moveConditional if else
syn keyword moveRepeat while loop
syn keyword moveKeyword abort assert return

" Comments
syn match moveComment "//.*$"
syn region moveComment start="/\*" end="\*/"

" Strings
syn region moveString start='"' end='"' skip='\\"'
syn region moveByteString start='b"' end='"' skip='\\"'

" Numbers
syn match moveNumber "\<\d\+\>"
syn match moveNumber "\<0x[0-9a-fA-F]\+\>"

" Operators
syn match moveOperator "+"
syn match moveOperator "-"
syn match moveOperator "\*"
syn match moveOperator "/"
syn match moveOperator "%"
syn match moveOperator "="
syn match moveOperator "=="
syn match moveOperator "!="
syn match moveOperator "<"
syn match moveOperator ">"
syn match moveOperator "<="
syn match moveOperator ">="
syn match moveOperator "&&"
syn match moveOperator "||"
syn match moveOperator "!"

" Highlighting
hi def link moveKeyword Keyword
hi def link moveType Type
hi def link moveBoolean Boolean
hi def link moveConditional Conditional
hi def link moveRepeat Repeat
hi def link moveComment Comment
hi def link moveString String
hi def link moveByteString String
hi def link moveNumber Number
hi def link moveOperator Operator

let b:current_syntax = "move"