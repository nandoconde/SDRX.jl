struct Block
    chunks::Vector{Chunk}
    cycles::UInt32
    sizeheader::UInt32 # defaults to 0
    sizefooter::UInt32 # defaults to 0
end