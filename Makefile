VERSION=master
ARCHIVE=$(VERSION).zip
SRCDIR=cgreen-$(VERSION)
PAYLOADDIR=payload

all: binaries
	packagesbuild cgreen.pkgproj
	mv build/Cgreen.pkg build/cgreen-$(VERSION).pkg

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
	rm -rf build $(PAYLOADDIR) $(SRCDIR) *.zip* *.tgz* payload build cgreen-$(VERSION) *~
