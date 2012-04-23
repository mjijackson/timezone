#!/usr/bin/env coffee
require("../proof") 5, ({ tz }) ->
  detroit = tz require("../../zones/America/Detroit"), "America/Detroit"
  @equal tz(detroit("1904-12-31 23:59:59"), "%F %T"), "1905-01-01 05:32:10", "to UTC beforeend of LMT"
  @equal tz(detroit("1905-01-01 00:00:00"), "%F %T"), "1905-01-01 06:00:00", "to UTC at end of LMT"

  @equal detroit(tz("1905-01-01 05:32:11"), "-1 millisecond", "%Z"), "LMT", "from UTC before end of LMT"
  @equal detroit(tz("1905-01-01 05:32:11"), "%Z"), "CST", "from UTC at end of LMT"
  @equal detroit(tz("1905-01-01 05:32:11"), "+1 millisecond", "%Z"), "CST", "from UTC after end of LMT"
