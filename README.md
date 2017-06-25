# ZeroBasedIndexing

[![Build Status](https://travis-ci.org/djsegal/ZeroBasedIndexing.jl.svg?branch=master)](https://travis-ci.org/djsegal/ZeroBasedIndexing.jl)

This package implements zero-based indexing in Julia. Zero-based indexing affects only your code. Functions from other packages/modules will still function properly, but when you index into the arrays they return, the indices will start at 0 instead of 1. This makes it easy to gradually transition your codebase from obsolete one-based indexing to proper zero-based indexing.

## Usage

```julia
julia> using ZeroBasedIndexing

julia> zerobased() # enable zero-based indexing in current module

julia> x = [1,2,3]
3-element Array{Int64,1}:
 1
 2
 3

julia> for i = 0:2 println(x[i]) end
1
2
3

julia> x[0] = 0
0

julia> x
3-element Array{Int64,1}:
 0
 2
 3
```

## TODO

-  Don't rewrite non-numeric indexes or numeric indexes into Associatives
-  Rewrite BoundsErrors
