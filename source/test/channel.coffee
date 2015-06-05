should = require 'should'
net = require 'net'
Channel = require '../channel'

describe 'Channel', ->
  it 'should not create a channel without socket', -> (-> new Channel).should.throw()
  it 'should create a channel', ->
    (new Channel socket:new net.Socket).should.be.an.instanceof Channel

  it 'should transmit the message', (done) ->
    server = new net.createServer (connection) ->
      (new Channel socket:connection).on 'data', (message) -> if message?.test then done()
    server.listen()
    (new Channel socket:net.createConnection port: server.address().port).write test:true
