# DefCon 22 Human Badge for OpenSpin

A command-line project for working with the DefCon 22 Human Badge and OpenSpin.

## Requirements
* OpenSpin compiler - https://code.google.com/p/open-source-spin-compiler/
* Brad's Spin Tools loader (bstl) - http://www.fnarfbargle.com/bst.html
* Minicom (or equivalent) for connecting

## Getting OpenSpin
The easiest way is to download SimpleIde - http://learn.parallax.com/node/640.

## Using
Type `make` or `make help` to read build instructions.

Edit the Makefile if you're spin compiler isn't in /opt/parallax/bin.

You'll also want to put bstl in /opt/parallax/bin (or, edit the Makefile).

Lastly, on OS X you'll want to get bstl-0.07-pre1 to download 

## LICENSE
The project is under the MIT license. The code came from Parallax,
Jon "JonnyMac" McPhalen and Ryan "1o57" Clarke and was already under the MIT
license.

I added the build system and licensed it under the same terms.
