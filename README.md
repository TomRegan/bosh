# Bosh

A provisioning tool that uses bash.

![bosh](http://i.imgur.com/2E5GqCR.png)

## Usage / Structure

### Install

* Clone or unpack the files from the [bosh repository](https://github.com/TomRegan/bosh)
* Set `BOSH_HOME` to the base directory of the bosh  install

### Run

    ./bosh <script>

Where `script` is the name of a script in the `run/` directory.

### Remote Install

Once bosh is installed on your workstation, you can deploy it and run
scripts on remote hosts using the `-r` (`--remote`) option.

    ./bosh -r|--remote [user@]<hostname> <script>

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

## Extending / Developing

### API

This isn't complete; it's best to read the scripts at the moment.

`require` causes bosh to fail if conditions don't match
* `root` fail if not root
* `os <name>` fail if different os. If linux, OS name is calculated by reading
the ID property from `/etc/os-version`
`install`
* Takes a package name

### Bugs

    code[.]tom[.]regan[@]gmail[.]com

Bosh is under development and should not be trusted with anything important.
