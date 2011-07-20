fs = require "fs"
{TwerpTest} = require "twerp"

{tz} = require "../lib/timezone"

tz.timezones require "./data/northamerica"

utc = (splat...) -> new Date(Date.UTC.apply(null, splat))

bicentenial = utc(1976, 6, 4)
moonwalk = utc(1969, 6, 21, 02, 36)
y2k = utc(2000, 0, 1)

MINUTE = 60 * 1000
HOUR = MINUTE * 60
DAY = HOUR * 24

readDate = (date) ->
  [year, month, day] = /^(\d{4})(\d{2})(\d{2})$/.exec(date).slice(1)
  new Date(Date.UTC(parseInt(year, 10), parseInt(month, 10) - 1, parseInt(day, 10)))

class exports.OffsetTest extends TwerpTest
  "test: convert from UTC to America/Detroit": (done) ->
    @equal tz(utc(1980, 0, 1), "America/Detroit", "%F %T"), "1979-12-31 19:00:00"
    done 1

  "test: convert from UTC to America/Detroit during DST": (done) ->
    try
      @equal tz(utc(1976, 6, 4), "America/Detroit", "%F %T"), "1976-07-03 20:00:00"
    catch e
      console.log e.stack
    done 1