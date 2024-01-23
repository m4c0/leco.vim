vim9script

var def_app = "error"

def Run()
  exe "!" .. def_app
enddef

export def SetupCppBuffer()
  const base = expand("%:t:r")
  var cmd = ""
  if search('#pragma leco tool', 'nw') > 0
    cmd = base .. ".exe"
  elseif search('#pragma leco app', 'nw') > 0
    cmd = base .. ".app/**/" .. base .. ".exe"
  else
    return
  endif

  def_app = expand("out/x86*/" .. cmd)
  command! -nargs=0 LecoRun Run()
  nmap <Leader>v :LecoRun<CR>
enddef
