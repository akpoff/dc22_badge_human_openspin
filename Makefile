# -*- Makefile -*-

# =================================================================================================
#
#   File....... Makefile
# 
#   Authors.... Aaron Poffenberger
#               MIT License
#               -- see below for terms of use
#
#   E-mail..... akp@hypernote.com
#
# =================================================================================================


BANNER="DefCon 22 Badge"
BSTL="/opt/parallax/bin/bstl"
BINARY="build/dc22_badge_human.binary"
TERM="/usr/local/bin/minicom"
RM="rm"
SPIN=/opt/parallax/bin/openspin

help : banner-display

all : binary

binary : *.spin
	@mkdir -p build
	$(SPIN)  dc22_badge_human.spin -o $(BINARY)

clean : 
	$(RM) -f $(BINARY)

download :
	$(BSTL) -u $(BINARY)

install : install_ram

install_eeprom : all
	$(BSTL) -p3 $(BINARY)

install_ram : all
	$(BSTL) -p1 $(BINARY)

term :
	$(TERM) -b 57600 -w -D

banner-display :
	@echo "[H[2J[33;1m$(BANNER)[0m"
	@echo " "
	@echo "This makefile will attempt to build the components of the indicated module(s)."
	@echo " "
	@echo "	make dc22_badge_human.binary == [31;1mall[0m"
	@echo "	make dc22_badge_human.binary == [31;1mbinary[0m"
	@echo "	clean-up                     == [31;1mclean[0m"
	@echo "	download eeprom image        == [31;1mdownload[0m"
	@echo "	help -- this message         == [31;1mhelp[0m"
	@echo "	install to badge ram         == [31;1minstall[0m"
	@echo "	install to badge eeprom      == [31;1minstall_eeprom[0m"
	@echo "	install to badge ram         == [31;1minstall_ram[0m"
	@echo "	license                      == [31;1mlicense[0m"
	@echo "	start term                   == [31;1mterm[0m"
	@echo " "

license :
	@echo "Terms of Use: MIT License"

	@echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this"
	@echo "software and associated documentation files (the \"Software\"), to deal in the Software"
	@echo "without restriction, including without limitation the rights to use, copy, modify,"
	@echo "merge, publish, distribute, sublicense, and/or sell copies of the Software, and to"
	@echo "permit persons to whom the Software is furnished to do so, subject to the following"
	@echo "conditions:"
	@echo ""
	@echo "The above copyright notice and this permission notice shall be included in all copies"
	@echo "or substantial portions of the Software."
	@echo ""
	@echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,"
	@echo "INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A"
	@echo "PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT"
	@echo "HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF"
	@echo "CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE"
	@echo "OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
