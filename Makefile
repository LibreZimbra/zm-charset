# SPDX-License-Identifier: AGPL-3.0-or-later

all:
	rm -Rf build
	$(ANT) -Dzimbra.buildinfo.version=$(ZIMBRA_VERSION)

include build.mk

install:
	$(call mk_install_dir, lib/jars)
	$(call mk_install_dir, jetty_base/common/endorsed)

	# different name to make ivy find it
	cp build/zm-charset-*.jar $(INSTALL_DIR)/lib/jars/zm-charset.jar
	cp build/zm-charset-*.jar $(INSTALL_DIR)/jetty_base/common/endorsed/zimbra-charset.jar

clean: clean-ant
