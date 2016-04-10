# Bosh

A provisioning tool that uses bash.

<p align=center>
<img src="http://i.imgur.com/3qtzFj6.png" />
</p>

## Usage / Structure

### Install

* Clone or unpack the files from the [bosh repository](https://github.com/TomRegan/bosh)
* Set `BOSH_HOME` to the base directory of the bosh install

### Run

    ./bosh <script>

Where `script` is the name of a script in the `run/` directory.

### Remote Install

Once bosh is installed on your workstation, you can deploy it and run
scripts on remote hosts using ssh.

    ./bosh [user@hostname] <script>

### Directory Layout

    .
    |-- bin/
    |-- etc/
    |   |-- deploy/
    |   |-- post_deploy/
    |   `-- scripts
    |-- lib/
    `-- libexec/
        `-- core/
            |-- require/
            `-- package/


* `libexec` internal scripts
** `bosh` is the core program
** `core` modules which provide functions to bosh
** `core/require` the `require` module
** `core/package` package management module
* `etc` configuration
** `deploy` scripts to install packages
** `post_deploy` scripts to configure installed packages
** `scripts` run-scripts which combine install and configure scripts
* `lib` ancillary scripts
* `bin` entry point

### Bugs

    code[.]tom[.]regan[@]gmail[.]com

Bosh is under development and should not be trusted with anything important.
