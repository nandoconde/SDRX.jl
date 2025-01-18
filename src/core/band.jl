struct Band
    centerfreq::Frequency
    translatedfreq::Frequency
    inverted::Bool
    delaybias::Duration # defaults to 0
    bandwidth::Frequency
end