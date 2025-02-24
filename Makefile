vivado = $(error vivado must be defined)
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
