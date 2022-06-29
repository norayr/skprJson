.POSIX:

all:
	@if [ ! -d build ]; then \
		mkdir build;   \
	fi
	@cd build; voc -s ${.CURDIR}/src/skprCharStack.Mod \
			 ${.CURDIR}/src/skprJson.Mod

clean:
	rm -rf build
