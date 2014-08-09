# DefCon 22 Human Badge for OpenSpin

A command-line project for working with the DefCon 22 Human Badge and
OpenSpin.

## Requirements
* OpenSpin compiler - https://code.google.com/p/open-source-spin-compiler/
* Brad's Spin Tools loader (bstl) - http://www.fnarfbargle.com/bst.html
* Minicom (or equivalent) for connecting

## Getting OpenSpin
The easiest way is to download SimpleIde -
http://learn.parallax.com/node/640.

## Using
Type `make` or `make help` to list build targets (see next section
also).

Edit the Makefile if you're spin compiler isn't in /opt/parallax/bin.

You'll also want to put bstl in /opt/parallax/bin (or, edit the
location in the Makefile).

Lastly, on OS X get at least bstl-0.07-pre1 if youw ant to download
the eeprom image from the badge.

## Make Targets
* `make all` == make dc22_badge_human.binary
* `make binary` == make dc22_badge_human.binary
* `make clean` == clean-up
* `make download` == download eeprom image
* `make help` == help -- this message
* `make factory` == restore factory binary to eeprom
* `make install` == install to badge ram
* `make install_eeprom` == install to badge eeprom
* `make install_ram` == install to badge ram
* `make license` == show license
* `make term` == connect to badge via terminal

## Make Variables
* `BSTL="/opt/parallax/bin/bstl"`
* `BINARY="build/dc22_badge_human.binary"`
* `FACTORY="factory/dc22_badge_human.binary"`
* `TERM="/usr/local/bin/minicom"`
* `RM="rm"`
* `SPIN="/opt/parallax/bin/openspin"`

## LICENSE
The project is under the MIT license. The code came from Parallax, Jon
"JonnyMac" McPhalen and Ryan "1o57" Clarke and was already under the
MIT license.

I added the build system and licensed it under the same terms.
