# fftw
Simple conda/binstar builder for FFTW

To have `binstar` build this itself on linux, just run

```sh
binstar-build submit .
```

in the same directory as the `.binstar.yml` file.

Once that has been done, you can go to the web page (listed in the output of
the previous command) to view the build.  Once that has succeeded, you can
automate the build process to happen every time you push to github by clicking
on the "Settings" tab, then "Continuous Integration".  Enter the path to the
github repository (and any other options necessary -- notably the subdirectory,
if `.binstar.yml` is not in the top level of the repo), and press "Update CI".
