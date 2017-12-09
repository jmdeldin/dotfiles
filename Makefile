PKG_NAME := $(shell basename $(CURDIR))
PARENT_DIR := $(dir $(CURDIR))
IGNORE_FLAGS := --ignore=README.md --ignore=Makefile

.PHONY: all
all:
	cd $(PARENT_DIR) && stow -S $(PKG_NAME) -t $(HOME) -v $(IGNORE_FLAGS)

.PHONY: refresh
refresh:
	cd $(PARENT_DIR) && stow -R $(PKG_NAME) -t $(HOME) -v $(IGNORE_FLAGS)

.PHONY: all
clean:
	cd $(PARENT_DIR) && stow -D $(PKG_NAME) -t $(HOME) -v
