# leco.vim

Vim plugin with shortcuts for editing LECO™ modules

This should be compatible with most plugin loaders. I personally use Vim's
pack. So it is as easy as cloning this repo inside
`$MYVIMRC/pack/m4c0/start/leco.vim`.
 
It requires some extra plugin boilerplate, but as an easy hacky plugin, it
works fine.

Features (so far):
* Whenever a `cpp` or `cppm` file is loaded/saved and its buffer contains a
  line with `#pragma leco`, then the plugin creates a `LecoRun` command and a
  corresponding `nmap <Leader>v`. That command will run the latest tool/app
  loaded.
