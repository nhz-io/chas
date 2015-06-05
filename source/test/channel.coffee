should = require 'should'
net = require 'net'
Channel = require '../channel'

describe 'Channel', ->
  it 'should not create a channel without socket', -> (-> new Channel).should.throw()
  it 'should create a channel', ->
    (new Channel socket:new net.Socket).should.be.an.instanceof Channel
