# fftw
Simple python conda builder for [FFTW](http://www.fftw.org/)

The resulting conda/anaconda packages are available
[here](https://anaconda.org/moble/fftw), and can be installed with

```sh
conda install -c moble fftw
```


## How this works

Note: All the following steps are combined in a simple script I keep
[here](https://github.com/moble/auto_version/blob/master/update_anaconda_org.sh).

A `conda` package can be created from these files by running

```sh
conda build .
```

This downloads and compiles the code as desired, and packages it all up nicely
in binary form for use in an anaconda distribution.  However, this doesn't
actually install anything, or make it available publicly.  To make it available
from [anaconda.org](https://anaconda.org/), you need to run the `anaconda
upload` command noted at the end of the output of the `conda build` command.

You should probably also support python 3 if possible.  Activate the python 3
environment, then run, e.g.,

```sh
conda build --python 3.4 .
```

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
