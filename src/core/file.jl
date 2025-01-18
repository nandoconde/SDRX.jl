struct File
    url::URI
    timestamp::Union{Nothing, DateTime}
    offset::UInt32 # defaults to 0
    lane::Lane
    previous::Union{Nothing, URI}
    next::Union{Nothing, URI}
    owner::Union{Nothing, String}
    copyright::Union{Nothing, String}
end