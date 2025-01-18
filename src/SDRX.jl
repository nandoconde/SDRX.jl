module SDRX

import Dates: DateTime
import FileIO
import URIs: URI
import XML
import XML: children, tag

include("core/metadata.jl")
include("sdr.jl")

struct NonComplianceError <: Exception
    str::String
end

# Write your package code here.

function load(f::FileIO.File{FileIO.format"SDRX"})
    # read XML document with XML.jl parser, checks
    #   - "well-formed"ness of document
    #   - "well-formed"ness of entities
    doc = XML.read(f.filename, Node)

    # find "metadata" element (there should not be any other, save for the header)
    i_ = 0
    for (i, child) in enumerate(children(doc))
        if tag(child) == "metadata"
            i_ = i
            break
        end
    end
    i_ == 0 && throw(NonComplianceError("Missing 'metadata' XML Element."))
    metadata = doc[i_]
    # assert that GNSS SDR Metadata standard is followed
    #   checks that "xmlns" field corresponds to SDRX template

end

end
