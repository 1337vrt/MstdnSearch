PROGRAM_NAME=mstdnsearch
VERSION=1.1

DATA_DIR=/usr/share
PROGRAM_DIR=/usr/bin

install:
	install -Dm755 mstdnsearch.sh $(PROGRAM_DIR)/$(PROGRAM_NAME)
	mkdir -p $(DATA_DIR)/$(PROGRAM_NAME)/instances
	install -Dm644 instances/* $(DATA_DIR)/$(PROGRAM_NAME)/instances

uninstall:
	rm -Rf $(PROGRAM_DIR)/$(PROGRAM_NAME)
	rm -Rf $(DATA_DIR)/$(PROGRAM_NAME)