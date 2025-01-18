struct Frequency
    format::String # Hz, kHz, MHz, GHz
    value::Float64
end

struct Duration
    format::String # ns, us, ms, sec
    value::Float64
end

struct Position
    datum::String # defaults to "WGS-84"
    lat::Float64
    lon::Float64
    height::Float64
end