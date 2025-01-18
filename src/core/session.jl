struct Session
    # metadata
    toa::Union{Nothing, DateTime}
    position::Union{Nothing, Position}
    system::Union{Nothing, System}
    poc::Union{Nothing, String}
    contact::Union{Nothing, String}
    campaign::Union{Nothing, String}
    scenario::Union{Nothing, String}
end