Rx = require "rx"

module.exports = 

class StreamFromPages 
  constructor: (@action) ->
  stream: ->
    _fetchSomething = (token) => 
      Rx.Observable.defer(
        => Rx.Observable.fromPromise @action(token)
      ).flatMap ({items, nextToken}) =>
        actualItems = Rx.Observable.fromArray items
        nextItems = if nextToken? then _fetchSomething(nextToken) else Rx.Observable.empty()
        Rx.Observable.concat actualItems, nextItems

    _fetchSomething()