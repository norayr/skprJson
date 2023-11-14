VOC = /opt/voc/bin/voc
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir_path := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
ifndef BUILD
BUILD="build"
endif
build_dir_path := $(mkfile_dir_path)/$(BUILD)
current_dir := $(notdir $(patsubst %/,%,$(dir $(mkfile_path))))
BLD := $(mkfile_dir_path)/build
DPD  =  deps
ifndef DPS
DPS := $(mkfile_dir_path)/$(DPD)
endif
all: get_deps build_deps buildThis

get_deps:
	mkdir -p $(DPS)
	#time and strutils should be brought as dependencies.
	#if [ -d $(DPS)/strutils ]; then cd $(DPS)/strutils; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/strutils; cd -; fi
	if [ -d $(DPS)/lists ]; then cd $(DPS)/lists; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/lists; cd -; fi
	if [ -d $(DPS)/skprLogger ]; then cd $(DPS)/skprLogger; git pull; cd -; else cd $(DPS); git clone https://github.com/norayr/skprLogger; cd -; fi

build_deps:
	mkdir -p $(BUILD)
	cd $(BUILD)
	make -f $(DPS)/lists/GNUmakefile BUILD=$(BUILD)
	make -f $(DPS)/skprLogger/GNUmakefile BUILD=$(BUILD)

buildThis:
	cd $(BUILD) && $(VOC) -s $(mkfile_dir_path)/src/skprCharStack.Mod
	cd $(BUILD) && $(VOC) -s $(mkfile_dir_path)/src/skprJson.Mod

tests:
	#cd $(BUILD) && $(VOC) $(mkfile_dir_path)/test/testList.Mod -m
	#build/testList

clean:
	if [ -d "$(BUILD)" ]; then rm -rf $(BLD); fi
