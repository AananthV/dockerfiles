# Neovim

Take your editor where you go!

Extend the above dockerfile, install language servers using

```dockerfile
RUN node /usr/src/language_installer/install.js [language]
```

Language Server installation instructions must be put in `./language_installer/installer`. Currently only js and java are present. Instructions can be found [here](https://github.com/neoclide/coc.nvim/wiki/Language-servers) on the COC wiki. 
