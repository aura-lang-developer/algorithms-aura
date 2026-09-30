# ==============================================================================
# Algoritmos y Estructuras en Aura Lang
# Makefile - Automatización de tareas de compilación y pruebas
# ==============================================================================

.PHONY: all build run test test-structures test-algorithms check clean fmt help

all: build

build:
	@./build.sh build

run:
	@./build.sh run

test:
	@./build.sh test

test-structures:
	@./build.sh test:structures

test-algorithms:
	@./build.sh test:algorithms

check:
	@./build.sh check

clean:
	@./build.sh clean

fmt:
	@aurac fmt src/ tests/

help:
	@./build.sh help
