using ITensors

export chain

"""
Build 1D chain
using the Lattice vector is overkill for a chain but makes it easy to
generalize to other geometries
"""
function chain(n::Int; is_periodic = false, neighbor = 1)
    nbonds = n - (is_periodic ? 0 : neighbor)
    chain = Lattice(undef, nbonds)
    for i in 1:nbonds
    chain[i] = LatticeBond(i, ((i + neighbor - 1) % n) + 1)
    end
    chain
end
