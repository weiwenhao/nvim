" Vim syntax file for nature programming language

if exists("b:current_syntax")
    finish
endif

syn keyword natureCommentTodo TODO FIXME XXX TBD contained
syn keyword natureKeyword var try struct type fn import in as return is throw union let gen
syn keyword natureType int uint u8 i8 u16 i16 u32 i32 u64 i64 float f64 f32 bool string any null
syn region natureSingleString start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@Spell
syn region natureDoubleString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn keyword natureBoolean		true false
syn match natureLineComment      "\/\/.*" contains=@Spell,natureCommentTodo

syn match   natureSpecialCharacter "'\\.'"
syn match   natureNumber           "\<0[bB][0-1]\+\(_[0-1]\+\)*\>"
syn match   natureNumber           "\<0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match   natureNumber           "\<0\([0-7]\+\(_[0-7]\+\)*\)\?\>"
syn match   natureNumber           "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match   natureNumber           "\<\d\+\(_\d\+\)*[eE][+-]\?\d\+\>"
syn match   natureNumber           "\<[1-9]\d*\(_\d\+\)*\(\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\)\?\>"
syn match   natureNumber           "\<\(\d\+\(_\d\+\)*\)\?\.\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\>"
syn match   natureNumber           "\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\>"
syn keyword natureConditional	if else 
syn keyword natureRepeat for in
syn keyword natureException try throw
syn keyword natureInclude import

" 函数名称
syn keyword natureFunction print println

hi link natureKeyword Keyword
hi link natureCommentTodo SpecialComment
hi link natureType Type
hi link natureNumber Number
hi link natureSpecialCharacter Special
hi link natureSingleString String
hi link natureDoubleString String
hi link natureBoolean Boolean
hi link natureLineComment Comment
hi link natureConditional Conditional
hi link natureException Exception
hi link natureRepeat Repeat
hi link natureFunction Function
hi link natureInclude Include

" Set the default highlighting for nature syntax
let b:current_syntax = "nature"


