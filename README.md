# retdec-docker-toolbox-wrapper
Small batch script wrapper to easily run [retdec](https://github.com/avast-tl/retdec) on a Windows machine with Docker Toolbox.

After building the image with the official Dockerfile it is easy enough to run retdec with
`docker run --rm -v /path/to/local/directory:/destination retdec retdec-decompiler.py /destination/binary`  
However I discovered that on my Windows machine, this would not work because the permissions for the `/destination` directory where incorrect, so I had to add `-u root` to the `docker run` command.  
Next, I wanted to simply specify an executable, without having to separate path and filename every time.  
This however requires to convert the paths, so remove the colon after the drive letter, switch backslashes for forward slashes, make sure the drive letter is lowercase and so on.  Oh, and don’t forget that you can have other parameters as well.  
This wrapper tries to accommodate for all of this to make using retdec on a Windows machine with Docker Toolbox as easy and transparent as possible.

Please see [this link](https://support.divio.com/local-development/docker/how-to-use-a-directory-outside-cusers-with-docker-toolboxdocker-for-windows) if you need to analyze files outside of your `C:\Users` directory.
