if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif

let g:quickrun_config.shelltest = {
    \ 'command': 'shelltest',
    \ 'exec':    '%c -nocolor %s'
    \ }
