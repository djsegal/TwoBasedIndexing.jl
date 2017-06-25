baremodule ZeroBasedIndexing
using Main: Base
export zerobased

for n = 1:5
    Base.eval(ZeroBasedIndexing, :(getindex(A, $([Symbol("i$i") for i = 1:n]...)) =
                                  Base.getindex(A, $([:($(Symbol("i$i"))+1) for i = 1:n]...))))
end
getindex(A, inds...) = Base.getindex(A, map(x->x+1, inds)...)

for n = 1:5
    Base.eval(ZeroBasedIndexing, :(setindex!(A, X, $([Symbol("i$i") for i = 1:n]...)) =
                                  Base.setindex!(A, X, $([:($(Symbol("i$i"))+1) for i = 1:n]...))))
end
setindex!(A, X, inds...) = Base.setindex!(A, X, map(x->x+1, inds)...)

function zerobased(mod=Base.current_module())
    Base.eval(mod, quote
        const getindex = $getindex
        const setindex! = $setindex!
    end)
    nothing
end
end # module
