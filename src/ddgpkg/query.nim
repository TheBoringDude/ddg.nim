# main ddg query functions

import std/[httpclient, json, strformat, uri]
import output

const userAgent = "nim-ddg/[DuckDuckGo]" # useragent to use with request


proc requestResponse(website: string): JsonNode =
    # request website and return json response

    # create new client
    let client = newHttpClient(userAgent = userAgent)
    let r = client.getContent(website)

    # return json
    result = parseJson(r)

proc query*(q: string): DdgInstantAnswer =
    ## query gets the responses and parses it to be accessible to object

    # encode query strings
    let query = encodeUrl(q)

    # get json response
    let resp = requestResponse(&"https://api.duckduckgo.com/?q={query}&format=json")

    result = to(resp, DdgInstantAnswer)
