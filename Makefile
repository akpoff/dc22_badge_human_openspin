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
FACTORY="factory/dc22_badge_human.binary"
TERM="/usr/local/bin/minicom"
RM="rm"
SPIN="/opt/parallax/bin/openspin"

help : banner-display

all : binary

binary : *.spin
	@mkdir -p build
	$(SPIN)  dc22_badge_human.spin -o $(BINARY)

clean : 
	$(RM) -f $(BINARY)

download :
	$(BSTL) -u $(BINARY)

factory :
	$(BSTL) -p3 $(BINARY)

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
	@echo "	[31;1mmake all[0m            == make dc22_badge_human.binary"
	@echo "	[31;1mmake binary[0m         == make dc22_badge_human.binary"
	@echo "	[31;1mmake clean[0m          == clean-up"
	@echo "	[31;1mmake download[0m       == download eeprom image"
	@echo "	[31;1mmake help[0m           == help -- this message"
	@echo "	[31;1mmake factory[0m        == restore factory binary to eeprom"
	@echo "	[31;1mmake install[0m        == install to badge ram"
	@echo "	[31;1mmake install_eeprom[0m == install to badge eeprom"
	@echo "	[31;1mmake install_ram[0m    == install to badge ram"
	@echo "	[31;1mmake license[0m        == show license"
	@echo "	[31;1mmake term[0m           == connect to badge via terminal"
	@echo " "
	@echo "[33;1mVariables[0m"
	@echo " "
	@echo "	[31;1mBSTL=[0m\"/opt/parallax/bin/bstl\""
	@echo "	[31;1mBINARY[0m=\"build/dc22_badge_human.binary\""
	@echo "	[31;1mFACTORY[0m=\"factory/dc22_badge_human.binary\""
	@echo "	[31;1mTERM[0m=\"/usr/local/bin/minicom\""
	@echo "	[31;1mRM[0m=\"rm\""
	@echo "	[31;1mSPIN[0m=\"/opt/parallax/bin/openspin\""
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
