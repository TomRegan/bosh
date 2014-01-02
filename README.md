# Cobbler

A provisioning tool that uses bash

### Usage / Structure

    .
    |-- cobbler
    |-- configure/
    |-- core/
    |   `-- require
	|-- install
    `-- run

* `cobbler` is the core program
* `configure` resources used by user-scripts
* `core` modules which provide functions to cobbler
* `core/require` the `require` module
* `install` user-scripts to install packages
* `run` user-scripts

### API

`require` causes cobbler to fail if conditions don't match
* `root` fail if not root
* `os` fail if different os

### Usage

Set `COBBLER_HOME` to the base directory of the cobbler install

### Bugs

    code.tom.regan@gmail.com

Cobbler development is just starting.
