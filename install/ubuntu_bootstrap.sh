#!/usr/bin/env bash

require root; apt-get update 2>&1 > /dev/null
package native build-essential
package native git
package native unzip
