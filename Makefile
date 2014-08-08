# -*- Makefile -*-

BANNER="DefCon 22 Badge"
SHELL=/bin/bash
HERE=$(shell pwd)

help : banner-display

all : binary

binary: dc22_badge_human.spin
	@/opt/parallax/bin/openspin dc22_badge_human.spin


install : all
	@~/Downloads/bstl.osx dc22_badge_human.binary 

clean : 
	@rm -f dc22_badge_human.binary

minicom :
	@minicom -b 57600 -D /dev/tty.usbserial-DAXUCKH1 -w

banner-display :
	@echo "[H[2J[33;1m$(BANNER)[0m"
	@echo " "
	@echo "This makefile will attempt to build the components of the indicated module(s)."
	@echo " "
	@echo "	dc22_badge_human.binary    == [31;1mall[0m"
	@echo "	install to badge           == [31;1minstall[0m"
	@echo "	clean-up                   == [31;1mclean[0m"
	@echo " "
	@echo "You are currently in $(HERE)"
	@echo " "
