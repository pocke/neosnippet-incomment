function! neosnippet_incomment#call(name)
  return s:snippets[a:name]
endfunction



" {name: snip}
let s:snippets = {}



function! s:define_snip(name, content)
  let pair = s:comment_pair()
  let snip = pair[0] . a:content . pair[1]

  let s:snippets[a:name] = snip
endfunction


function! s:comment_pair()
  let pair = split(&l:commentstring, '\s*%s\s*')

  if len(pair) == 1
    call add(pair, '')
  end

  return pair
endfunction




let s:esc = ' vi'      " for escape modeline
let s:modeline = s:esc . 'm: set ${1:foldmethod=marker}: '
call s:define_snip('modeline', s:modeline)
unlet s:esc
unlet s:modeline
