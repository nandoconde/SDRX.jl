# an SDRX file may be either:
#   - a FileSet
#   - SDRMetadata
#
# a type-stable way to read this could be defining a sumtype with Moshi and then having
#   the user query the result from parsing to check which of them it is
#
# maybe it would be best to provide both ways to read a file
#   - easy & type-unstable
#   - messy & type-stable

# assume that fileset must be top level within metadata
@kwdef struct FileSet
    metadata::Union{Nothing, Metadata} = nothing
    files::Vector{URI} = URI[]
end

function parse_node(node::Node, ::Type{FileSet})
    # check attributes for id, artifact, comment
    metadata = metadata_from_attributes(node)
    # fileset
end

# 
@kwdef mutable struct SDRMetadata
    fileset::Union{Nothing, FileSet} = nothing
end