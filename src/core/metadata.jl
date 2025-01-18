
@kwdef mutable struct Metadata
    id::Union{Nothing, String} = nothing
    artifact::Union{Nothing, URI} = nothing
    comment::Union{Nothing, String} = nothing
end


function metadata_from_attributes(node::XML.Node)::Union{Nothing, Metadata}
    id = nothing
    artifact = nothing
    comment = nothing
end

include("ancillary.jl")
include("cluster.jl")
include("source.jl")
include("system.jl")
include("session.jl")
include("band.jl")
include("stream.jl")
include("lump.jl")
include("chunk.jl")
include("block.jl")
include("lane.jl")
include("file.jl")
