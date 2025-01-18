struct System
    sources::Vector{Source}
    clusters::Vector{Cluster}
    freqbase::Frequency
    equipment::Union{Nothing, String}
end