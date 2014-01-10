# Cobbler

A provisioning tool that uses bash

## Usage / Structure

### Install

* Clone or unpack the files from the [cobbler repository](https://github.com/TomRegan/cobbler)
* Set `COBBLER_HOME` to the base directory of the cobbler install

### Run

    ./cobbler <script>

Where `script` is the name of a script in the `run/` directory.

### Remote Install

Once `cobbler` is installed on your workstation, you can deploy it and run
scripts on VMs using the `-d` (deploy) and `-r` (remote) options.

    ./cobbler -d|--deploy [user@]<hostname

    ./cobbler -r|--remote [user@]<hostname> <script>

### Directory Layout

    .
    |-- cobbler
    |-- configure/
    |-- core/
    |   |-- require/
	|   `-- package/
	|-- install/
    `-- run/

* `cobbler` is the core program
* `configure` user scripts to configure installed packages
* `core` modules which provide functions to cobbler
* `core/require` the `require` module
* `core/package` package management module
* `install` user-scripts to install packages
* `run` user-scripts

## Extending / Developing

### API

This isn't complete; it's best to read the scripts at the moment.

`require` causes cobbler to fail if conditions don't match
* `root` fail if not root
* `os <name>` fail if different os. If linux, OS name is calculated by reading
the ID property from `/etc/os-version`
`install`
* Takes a package name

### Bugs

    code.tom.regan@gmail.com

Cobbler development is just starting.
