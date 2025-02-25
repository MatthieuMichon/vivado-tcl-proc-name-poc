ifndef vivado
    ifeq ($(shell which vivado),)
        $(error vivado must be present in PATH or passed as a variable)
    endif
    vivado = $(shell type -p vivado)
endif

XV ?= $(vivado)
MODE ?= batch
FLAGS ?= -quiet -nojournal -notrace -mode $(MODE)
WORKDIR	= ./run

.PHONY: all
all:
	mkdir -p $(WORKDIR)
	cd $(WORKDIR) && ${XV} ${FLAGS} -source ../run.tcl

.PHONY: clean
clean:
	$(RM) -r $(WORKDIR)
