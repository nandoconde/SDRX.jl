module SDRX

import Dates: DateTime
import FileIO
import URIs: URI
import XML
import XML: children, tag, Node


include("core/metadata.jl")
include("sdr.jl")


struct NonComplianceError <: Exception
    str::String
end


function load(f::FileIO.File{FileIO.format"SDRX"})
    # read XML document with XML.jl parser, checks
    #   - "well-formed"ness of document
    #   - "well-formed"ness of entities
    try
        doc = XML.read(f.filename, Node)
    catch
        throw(NonComplianceError("Error in XML parsing."))
    end

    # - doc[1] has the usual XML declaration (version & encoding)
    # - doc[2] should have the `metadata`
    # - there should not be other `metadata` elements
    i_ = 0
    for (i, child) in enumerate(children(doc))
        if tag(child) == "metadata"
            i_ == 0 ? i_ = i : throw(NonComplianceError("Only one 'metadata' element is allowed per file."))
        end
    end
    i_ == 0 && throw(NonComplianceError("Missing 'metadata' XML Element."))
    metadata = doc[i_]

    # metadata's only attribute should be the SML schema
    #   assert that GNSS SDR Metadata standard is followed
    #   checks that "xmlns" field corresponds to SDRX template
    #   - usual URI for XSD: "http://www.ion.org/standards/sdrwg/schema/metadata.xsd"
    #   - best URI for XSD: ?
    # TODO

    # decide between fileset or usual metadata file
    i_ = 0
    for (i, child) in enumerate(children(metadata))
        if tag(child) == "fileSet" # FIXME check if maybe conversion to lowercase is needed
            i_ == 0 ? i_ = i : throw(NonComplianceError("Only one 'fileSet' element is allowed per file."))
        end
    end
    i != 0 &&
    metadata = doc[i_]


    # iterate metadata's children to retrieve the expected attributes
    for (j, child) in enumerate(children(metadata))

    end

    #

    return
end

end
