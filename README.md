
# Vim Config

This is a dotfiles *like* package but it only contains my vim config.  Feel
free to use it. Note that this has only been tested on my macbook, and I'm
currently using vim 8.0 (though this same setup was working with vim 7.3.x).

# Setup

Just clone this repo and then run `vimconf/setup.sh`. This will create symbolic
links for the `.vimrc` file and a couple of modules that go into the `.vim`
folder. It will then run a vim command to install additional packages, and then
it will attempt to acutally build the YouCompleteMe package.

The last step is the most likely to fail, since it depends on having a compiler
and associated files installed. You may also choose to re-build it with
additional options like auto-complete for C based on Clang.

If you are using it, and run into problems or have a better way of doing
something feel free to send me a pull request or submit an issue.

# Note on how vim is configured

Currently I'm mostly doing Javascript / es6 programming with node.

**Important**: I have disabled `<Esc>` instead you must type `kj` quickly to
escape insert or visual mode.  This is quicker in my experience, and has the
added benefit of being more usable across different keyboard layouts.

YouCompleteMe code completion.  For javascript this uses tern. You will want to
install tern for your project.  If vim is opened from a directory with
`node_modules` it should be able to find `tern`.  You will also need to setup
your tern project via `.tern-project`.

Mine looks like this:


```json
{
    "plugins": {
        "node": {},
        "es_modules": {}
    },
    "libs": [
        "ecma5",
        "ecma6"
    ],
    "ecmaVersion": 6
}
```

Syntastic does syntax checking, but will only work if you have configured it
for your language.  For javascript this means that you will need eslint
installed and the associated config in your project.

For more information it is probably best to just look at the modules referenced
in `vimrc` and the comments in that file.
