function! neosnippet_modeline#snippet()
  let pair = s:comment_pair()

  let modeline = pair[0] . ' vim: set ' . '${1}' . ': ' . pair[1]

  return modeline
endfunction




function! s:comment_pair()
  let pair = split(&l:commentstring, '\s*%s\s*')

  if len(pair) == 1
    call add(pair, '')
  end

  return pair
endfunction
