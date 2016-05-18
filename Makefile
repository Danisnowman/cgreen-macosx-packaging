PAYLOADDIR=payload
VERSION=1.0.0
ARCHIVE=v$(VERSION).zip
SRCDIR=cgreen-$(VERSION)

all: binaries
	packagesbuild cgreen.pkgproj

.PHONY: binaries
binaries: $(PAYLOADDIR) sources
	cp $(SRCDIR)/build/src/libcgreen*.dylib $(PAYLOADDIR)/usr/local/lib
	cp $(SRCDIR)/build/tools/cgreen-runner $(PAYLOADDIR)/usr/local/bin
	cp -r $(SRCDIR)/build/include/cgreen $(PAYLOADDIR)/usr/local/include

$(PAYLOADDIR):
	mkdir -p $@/usr/local/bin $@/usr/local/include $@/usr/local/lib

sources:
	wget https://github.com/cgreen-devs/cgreen/archive/$(ARCHIVE)
	unzip -o $(ARCHIVE)
	cd $(SRCDIR); make

clean:
	rm -rf build $(PAYLOADDIR) $(SRCDIR) v*.zip* v*.tgz*
