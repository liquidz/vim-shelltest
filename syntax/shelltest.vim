""" Assersion
syn match stAssertion '\v.+'

hi def link stAssertion DiffChange

""" Identifier
syn match stDeref "\$\%(\k\+\|\d\)" contained
syn match stDeref "\$[-#*@!?]"      contained
syn match stDeref "\$\$"            contained

hi def link stDeref Identifier

""" String
syn region stString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=stDeref contained
syn region stString start=+'+ skip=+\\\\\|\\'+ end=+'+ contained

hi def link stString String

""" Require
syn match  stInclude '\v^\@require' nextgroup=stIncludeLine
syn region stIncludeLine start="" end="$" contained

hi def link stInclude     Statement
hi def link stIncludeLine Normal

""" Command
syn match stCommand '\v^[^$]*\$\s+' nextgroup=stCommandLine
syn region stCommandLine start="" skip="\\$" end="$" contains=stDeref,stString contained

hi def link stCommand Keyword


""" Comment
syn keyword stTodo         contained TODO FIXME XXX BUG
syn cluster stCommentGroup contains=stTodo
syn match   stComment      '\v^#.*'  contains=@stCommentGroup

hi def link stComment Comment
hi def link stTodo    Todo

let b:current_syntax = 'shelltest'
