# Build settings

# NOTE: The command must not be quoted.
ZIP_COMMAND = 7z -tzip a
TARGET_VERSION = $(shell cat manifest.json | jq .version)
TARGET_NAME = "pho-mist-$(TARGET_VERSION).xpi"


# The default target is to zip up the contents.
$(TARGET_NAME): manifest.json pho-mist-bg-200.png LICENSE
	@(echo Building $(TARGET_NAME))
	$(ZIP_COMMAND) $(TARGET_NAME) $^

build: $(TARGET_NAME)
!PHONY: build

name:
	@(echo $(TARGET_NAME))
!PHONY: name
