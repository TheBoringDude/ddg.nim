# ddg cli use-case
import std/[parseopt, json]

import ddgpkg/query
export query

proc help() =
  echo """
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
  """
  quit(0)

proc cli() =
  var
    q: string

    # query args
    qAll: bool
    qAbstract: bool
    qAbstractText: bool
    qAbstractSource: bool
    qAbstractURL: bool
    qImage: bool
    qHeading: bool
    qAnswer: bool
    qAnswerType: bool
    qRedirect: bool
    qDefinition: bool
    qDefinitionSource: bool
    qDefinitionURL: bool
    qType: bool
    qRelatedTopics: bool
    qResults: bool

  # parse commandline arguments
  for kind, key, val in getopt():
    case kind:
    of cmdArgument: q = key
    of cmdEnd: break
    of cmdLongOption, cmdShortOption:
      case key:
      of "help", "h": help()
      of "all", "a": qAll = true
      of "Abstract", "abstract": qAbstract = true
      of "AbstractText", "abstractText": qAbstractText = true
      of "AbstractSource", "abstractSource": qAbstractSource = true
      of "AbstractURL", "abstractUrl": qAbstractURL = true
      of "Image", "image": qImage = true
      of "Heading", "heading": qHeading = true
      of "Answer", "answer": qAnswer = true
      of "AnswerType", "answerType": qAnswerType = true
      of "Redirect", "redirect": qRedirect = true
      of "Definition", "definition": qDefinition = true
      of "DefinitionSource", "definitionSource": qDefinitionSource = true
      of "DefinitionURL", "definitionURL": qDefinitionURL = true
      of "Type", "type": qType = true
      of "RelatedTopics", "relatedTopics": qRelatedTopics = true
      of "Results", "results": qResults = true

  # show help if no argument is passed
  if q == "":
    help()

  # query
  let res = query(q)

  # print output
  if qAll or qAbstract:
    echo "\nAbstract: ", res.Abstract
  if qAll or qAbstractText:
    echo "\nAbstractText: ", res.AbstractText
  if qAll or qAbstractSource:
    echo "\nAbstractSource: ", res.AbstractSource
  if qAll or qAbstractURL:
    echo "\nAbstractURL: ", res.AbstractURL
  if qAll or qImage:
    echo "\nImage: ", res.Image
  if qAll or qHeading:
    echo "\nHeading: ", res.Heading
  if qAll or qAnswer:
    echo "\nAnswer: ", res.Answer
  if qAll or qAnswerType:
    echo "\nAnswerType: ", res.AnswerType
  if qAll or qRedirect:
    echo "\nRedirect: ", res.Redirect
  if qAll or qDefinition:
    echo "\nDefinition: ", res.Definition
  if qAll or qDefinitionSource:
    echo "\nDefinitionSource: ", res.DefinitionSource
  if qAll or qDefinitionURL:
    echo "\nDefinitionURL: ", res.DefinitionURL
  if qAll or qType:
    echo "\nType: ", res.Type
  if qAll or qRelatedTopics:
    echo "\nRelatedTopics: ", $res.RelatedTopics
  if qAll or qResults:
    echo "\nResults: ", $res.Results


when isMainModule:
  cli()

