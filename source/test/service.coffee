should = require 'should'
Service = require '../service'
Channel = require '../channel'
describe 'Service', ->
  it 'should not create a service without a channel', -> (-> new Service).should.throw()
  it 'should create a service', -> (new Service new Channel).should.be.an.instanceof Service
