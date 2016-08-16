require "should"

_ = require "lodash"
Promise = require "bluebird"
StreamFromPages = require "./streamFromPages"

sizePage = 10
generator = (pages) -> (page = 0) -> 
  nextToken = if pages[page + 1] then page + 1 else undefined
  Promise.resolve { items: pages[page], nextToken }

_it = (name, n) ->
  it name, (done) ->
    new StreamFromPages generator _createPages n
    .stream()
    .toArray()
    .subscribe (elements) ->
      elements.length.should.be.eql n
      done()  

describe "StreamFromPages", ->

  _it "return a empty stream", 0
  _it "return a elements from a once page", sizePage
  _it "return a many elements from some pages", sizePage + 5

  it "fail when promise is rejected", ->


_createPages = (n) ->
  return [[]] if n is 0
  _.chunk (_.times n, _.identity), sizePage