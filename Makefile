.POSIX:

ROOTDIR  = $$PWD

all:
	@if [ ! -d build ]; then \
		mkdir build;     \
	fi
	@cd build; voc -s ${ROOTDIR}/../src/skprCharStack.Mod \
			  ${ROOTDIR}/../src/skprJson.Mod

clean:
	rm -rf build
