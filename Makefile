# Default options
CC:=gcc
CCX:=g++
CFLAGS:=-O0 -g

# Dependency and targets
BIN:=union intersection
BIN_union_C:=union tiny_array
BIN_intersection_C:=intersection tiny_array
#BIN_union_CFLAGS_EXT:=
#BIN_union_CFLAGS:=


# Default make rules
all: $(BIN)

# Basic functions
define unique_cat_unit=
ifndef $(1)_$(2)_$(3)
$(1):=$($(1)) $(2)
$(1)_$(2)_$(3):=1
endif
endef
unique_cat=$(eval $(call unique_cat_unit,$(1),$(2),$(3)))

define eval_if_not_set_entity=
ifndef $(1)
$(1):=1
$(2)
endif
endef
eval_if_not_set=$(eval $(call eval_if_not_set_entity,$(1),$(2)))

# Rules for C Objects
define SourceToObject_C=
ifdef BIN_$(1)_CFLAGS
$(1).o:$(1).c
	$(CC) -c $(BIN_$(1)_CFLAGS) $(BIN_$(1)_CFLAGS_EXT) $(1).c
else
$(1).o:$(1).c
	$(CC) -c $(CFLAGS) $(BIN_$(1)_CFLAGS_EXT) $(1).c
endif
	
endef
$(foreach target,$(BIN),$(foreach obj_name,$(BIN_$(target)_C),$(call eval_if_not_set,$(obj_name)_object,$(call SourceToObject_C,$(obj_name)))))

# Rules for binarys
define ObjectToBinary=
$(1):$(2)
	$(CC) $(2) -o $(1)
endef
$(foreach target,$(BIN),$(foreach obj_name,$(BIN_$(target)_C),$(call unique_cat,$(target)_require,$(obj_name).o,cat_binary))$(eval $(call ObjectToBinary,$(target),$($(target)_require))))

# Cleaning rules
$(foreach target,$(BIN),$(foreach obj_name,$(BIN_$(target)_C),$(call unique_cat,trashs_obj,$(obj_name).o,cat_trash)))
trashs_bin:=$(BIN)

clean: clean_obj clean_bin

clean_obj:
	rm -f $(trashs_obj)
clean_bin:
	rm -f $(trashs_bin)
