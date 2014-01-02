# Cobbler

A provisioning tool that uses bash

## Usage / Structure

    .
    |-- cobbler
    |-- configure/
    |-- core/
    |   `-- require/
	|-- install/
    `-- run/

* `cobbler` is the core program
* `configure` resources used by user-scripts
* `core` modules which provide functions to cobbler
* `core/require` the `require` module
* `install` user-scripts to install packages
* `run` user-scripts

### Install

* Clone or unpack the files from the [cobble repository](https://github.com/TomRegan/cobbler)
* Set `COBBLER_HOME` to the base directory of the cobbler install

### Run

    ./cobbler <script>

Where `script` is the name of a script in the `run/` directory.

## Extending / Developing

### API

`require` causes cobbler to fail if conditions don't match
* `root` fail if not root
* `os <name>` fail if different os. If linux, OS name is calculated by reading
the ID property from `/etc/os-version`
`install`
* Takes a package name

### Bugs

    code.tom.regan@gmail.com

Cobbler development is just starting.
