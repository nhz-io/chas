events = require 'events'
Split = (require 'split-join').simple.Split
Join = (require 'split-join').simple.Join

module.exports = class Channel extends events.EventEmitter

  constructor: (options) ->
    unless options?.socket
      throw new Error 'Missing Socket'

    @socket = options.socket
    delete options.socket
    super options

    @split = new Split
    @join = new Join

    @socket.pipe @join
    @split.pipe @socket

  once: (event, callback) ->
    if event is 'data'
      @join.once.apply @join, arguments
    else
      super

  on: (event, callback) ->
    if event is 'data'
      @join.on.apply @join, arguments
    else
      super

  addListener: (event, callback) ->
    if event is 'data'
      @join.addListener event, callback
    else
      super

  removeListener: (event, callback) ->
    if event is 'data'
      @join.removeListener event, callback
    else
      super

  removeAllListeners: (event) ->
    if event is 'data'
      @join.removeAllListeners event
    else
      super

  listeners: (event) ->
    if event is 'data'
      @join.listeners event
    else
      super

  read: -> @join.read.apply @join, arguments

  write: (message) -> @split.write message

  close: (message) ->
    @split.end message
    @join.end()
    @socket.end()
    return this
