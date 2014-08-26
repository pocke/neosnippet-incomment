function! neosnippet_incomment#call(name)
  let pair = s:comment_pair()
  return pair[0] . s:snippets[a:name] . pair[1]
endfunction



" {name: snip}
let s:snippets = {}



function! s:define_snip(name, content)
  let s:snippets[a:name] = a:content
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

call s:define_snip('todo', ' TODO: ')
call s:define_snip('xxx', ' XXX: ')
