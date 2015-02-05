# fftw
Simple conda/binstar builder for FFTW

The resulting conda/binstar packages are available
[here](https://binstar.org/moble/fftw), and can be installed with

```sh
conda install -c moble fftw
```


## How this works

A `conda` package can be created from these files by running

```sh
conda build .
```

This downloads and compiles the code as desired, and packages it all up nicely
in binary form for use in an anaconda distribution.  However, this doesn't
actually install anything, or make it available publicly.  To make it available
from [binstar](https://binstar.org/), you need to run the `binstar upload`
command noted at the end of the output of the `conda build` command.

You need to do this yourself on OS X.  But to have `binstar` build this itself
on linux, just run

```sh
binstar-build submit .
```

in the same directory as the `.binstar.yml` file.

Once that has been done, you can go to the web page (listed in the output of
the previous command) to view the build.  Once that has succeeded, you can
automate the build process to happen every time you push to github by clicking
on the "Settings" tab, then "Continuous Integration".  Enter the path to the
github repository and any other options necessary.  Notably, if `.binstar.yml`
is not in the top level of the repo, enter the subdirectory where it is found.
Also, if you want to update the publicly available binaries (rather than just
testing that they can be built) enter `refs/heads/master` in the Upload
Branches section.  Then press "Update CI".  This will automatically run the
build on linux.
