# output response

import std/[json]

## RETURN FIELDS (https://duckduckgo.com/api)
# Abstract: topic summary (can contain HTML, e.g. italics)
# AbstractText: topic summary (with no HTML)
# AbstractSource: name of Abstract source
# AbstractURL: deep link to expanded topic page in AbstractSource
# Image: link to image that goes with Abstract
# Heading: name of topic that goes with Abstract
# Answer: instant answer
# AnswerType: type of Answer, e.g. calc, color, digest, info, ip, iploc, phone, pw, rand, regexp, unicode, upc, or zip (see the tour page for examples).
# Definition: dictionary definition (may differ from Abstract)
# DefinitionSource: name of Definition source
# DefinitionURL: deep link to expanded definition page in DefinitionSource
# RelatedTopics: array of internal links to related topics associated with Abstract
#   Result: HTML link(s) to related topic(s)
#   FirstURL: first URL in Result
#   Icon: icon associated with related topic(s)
#     URL: URL of icon
#     Height: height of icon (px)
#     Width: width of icon (px)
#   Text: text from first URL
# Results: array of external links associated with Abstract
#   Result: HTML link(s) to external site(s)
#   FirstURL: first URL in Result
#   Icon: icon associated with FirstURL
#     URL: URL of icon
#     Height: height of icon (px)
#     Width: width of icon (px)
#   Text: text from FirstURL
# Type: response category, i.e. A (article), D (disambiguation), C (category), N (name), E (exclusive), or nothing.
# Redirect: !bang redirect URL

type
    DdgInstantAnswer* = object ## base response
        Abstract*: string
        AbstractText*: string
        AbstractSource*: string
        AbstractURL*: string

        Image*: string
        Heading*: string

        Answer*: string
        AnswerType*: string

        Redirect*: string

        Definition*: string
        DefinitionSource*: string
        DefinitionURL*: string

        Type*: string

        ## TODO: json response is complex in here, use the objects below
        ##   it could be `complexResults` structure or `seq[otherResults]`
        RelatedTopics*: seq[JsonNode]
        Results*: seq[JsonNode]


    # complexResults = object
    #     Name: string
    #     Topics: seq[otherResults]

    # otherResults = object
    #     Result: string
    #     FirstURL: string
    #     Icon: otherResultsIcons

    # otherResultsIcons = object
    #     URL: string
    #     Height: int
    #     Width: int