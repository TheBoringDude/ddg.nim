# ddg.nim
Simple DuckDuckGo.com Instant Answer API wrapper for Nim

### Reference:
https://duckduckgo.com/api

## Install
```
nimble install https://github.com/TheBoringDude/ddg.nim.git
```

## Usage

    $ ddg [query] [result flags]


```
Usage: ddg <query> [print flag values (flag helpers)]
  
  Flag Helpers:
    --Abstract
    --AbstractText
    --AbstractSource
    --AbstractURL
    --Image
    --Heading
    --Answer
    --AnswerType
    --Redirect
    --Definition
    --DefinitionSource
    --DefinitionURL
    --Type
    --RelatedTopics
    --Results
```

### Integrating
```nim
import ddg

let q = query("duckduckgo")

# you can access the result values in each field
echo q.Abstract
```


##
### &copy; TheBoringDude | 2021