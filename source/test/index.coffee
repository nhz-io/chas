should = require 'should'
chas = require '../index'

describe 'chas', ->
  it 'should have Resource', -> chas.Resource.should.be.ok
  it 'should have Channel', -> chas.Channel.should.be.ok
  it 'should have Service', -> chas.Service.should.be.ok
  it 'should have Server', -> chas.Server.should.be.ok
