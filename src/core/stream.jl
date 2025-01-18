struct Stream
    bands::Vector{Band}
    ratefactor::UInt16
    quatization::UInt8
    packedbits::UInt8
    alignment::String
    shift::String
    format::String
    encoding::String # OB, OBA, SM, SMA, MS, MSA, TC, TCA, OG, OGA
end