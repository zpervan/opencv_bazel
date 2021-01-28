## OpenCV-Bazel

A template repository with a buildable OpenCV hello world application with Bazel.

In order to run the code, it is mandatory to install the needed dependencies. Position your terminal inside the scripts 
folder and run the following:
```
cd Scripts
chmod 777 install_ubuntu.sh
sudo ./install_ubuntu.sh
```

Also, there is a bash script which installs the essential packages for Manjaro (the same installation procedure as above).

After installing all needed dependencies and libraries, you should be able to run the code. Position your terminal into the
root of project. 
To run the hello-world example:
```
bazel run //Code:main
```

To run the tests:
```
bazel test //Code:test
```

If you encounter a error with the `libwebp` library during execution of the code, there is a chance that the `LD_LIBRARY_PATH`
is not set properly to point at the `lib` folder which contains built libraries. To set this, add the following to your `bashrc` script:
```
if [[ ! -d "$LD_LIBRARY_PATH" ]]; then 
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
fi
```
