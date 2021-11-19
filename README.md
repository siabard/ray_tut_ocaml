# Introduction

This project is using raylib with OCaml. Original tutorial is on [youtube](https://www.youtube.com/watch?v=JE7F7DLEjbo) and I study game engine and OCaml, so I decide move original C/C++ code to OCaml.

# Requirement

## OCaml

Install OCaml using `opam`.

```
opam switch create 4.13.1
```

## Raylib

You need a language binding of raylib for OCaml. Raylib for Ocaml is based on 0.3.7 of raylib.

```
opam depext raylib

opam install raylib
```
