# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import ddg

test "query sample -> get answer":
  let q = query("duckduckgo")
  assert q.Abstract == "DuckDuckGo is an internet search engine that emphasizes protecting searchers' privacy and avoiding the filter bubble of personalized search results. DuckDuckGo distinguishes itself from other search engines by not profiling its users and by showing all users the same search results for a given search term. The company is based in Paoli, Pennsylvania, in Greater Philadelphia and has 124 employees as of January 2021. The company name is a reference to the children's game duck, duck, goose."
