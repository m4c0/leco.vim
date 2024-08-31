vim9script

var def_app = "error"

def DefaultRunner(exe: string)
  const ars = " " .. get(g:, 'leco_args', "")
  if stridx(ars, "-t wasm") >= 0
    exe "!" .. expand("../leco/leco.exe") .. " webserver " .. ars
  else
    exe "!" .. exe
  endif
enddef

def Run()
  const Runner = get(g:, 'LecoRunner', DefaultRunner)
  if systemlist('uname -m')[0] == 'arm64'
    Runner(expand("out/arm64-apple-macosx*/" .. def_app))
  else
    Runner(expand("out/x86*/" .. def_app))
  endif
enddef

export def SetupCppBuffer()
  const base = expand("%:t:r")
  if search('^\s*#pragma leco tool$', 'nw') > 0
    def_app = base .. ".exe"
  elseif search('^\s*#pragma leco app$', 'nw') > 0
    def_app = base .. ".app/**/" .. base .. ".exe"
  else
    return
  endif

  command! -nargs=0 LecoRun Run()
  nmap <Leader>v :LecoRun<CR>

  const ars = " " .. get(g:, 'leco_args', "")
  &makeprg = expand("../leco/leco.exe") .. ars
  nmap <Leader>b :make<CR>
enddef
