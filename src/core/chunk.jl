struct Chunk
    lump::Lump
    sizeword::UInt8
    countwords::UInt8
    endian::String # defaults to "Little"
    padding::String # defaults to "None"
    wordshift::String
end