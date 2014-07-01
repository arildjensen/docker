SHELL    := /bin/bash
basename := $(shell pwd | xargs basename )
.DEFAULT_GOAL := image

image:
	docker build -t $(basename) .
