should = require 'should'
Channel = require '../channel'

describe 'Channel', ->
  it 'should create a channel', -> (new Channel).should.be.an.instanceof Channel
