include platform.mk

names = demo
files := $(foreach n,$(names),$(n).c)

TMP_PATH ?= tmps

ifeq ($(num),1)
	res := 'one'
else
	res := 'other'
endif

student := 'xiaoming' \
	'is a good student'


#how to define MARCO
define compile
	$(CC) demo.c
	mv a.out $@
endef

#use MARCO in eval
define print
$(1):
	@echo $(student)
	@echo $(1)
endef


all:
	git submodule update --init

#use info show expend fragment
#$(info $(call print,line))

#$(eval $(call print,line))


# trick for compile src to a dir
# symbol '|' is must, all words after symbol will not treat as prerequisites !
# in this ex,it will check dir is exist? if not, create it!
$(TMP_PATH)/plus_demo : libs/math.c | $(TMP_PATH)
	$(CC) demo.c $^ -o $@

$(TMP_PATH) :
	mkdir $(TMP_PATH)

PHONY: clean

3rd:
	cd libs && $(MAKE)

clean:
	cd libs && $(MAKE) clean