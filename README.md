# Bosh

A provisioning tool that uses bash.

![bosh](http://i.imgur.com/3qtzFj6.png)

## Usage / Structure

### Install

* Clone or unpack the files from the [bosh repository](https://github.com/TomRegan/bosh)
* Set `BOSH_HOME` to the base directory of the bosh  install

### Run

    ./bosh <script>

Where `script` is the name of a script in the `run/` directory.

### Remote Install

Once bosh is installed on your workstation, you can deploy it and run
scripts on remote hosts using ssh.

    ./bosh user@hostname <script>

### Directory Layout

    .
    |-- bosh
    |-- configure/
    |-- core/
    |   |-- require/
	|   `-- package/
	|-- install/
    `-- run/

* `bosh` is the core program
* `configure` user scripts to configure installed packages
* `core` modules which provide functions to bosh
* `core/require` the `require` module
* `core/package` package management module
* `install` user-scripts to install packages
* `run` user-scripts

### Bugs

    code[.]tom[.]regan[@]gmail[.]com

Bosh is under development and should not be trusted with anything important.
