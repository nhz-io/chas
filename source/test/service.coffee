should = require 'should'
net = require 'net'
Service = require '../service'
Channel = require '../channel'
describe 'Service', ->
  it 'should not create a service without a channel', -> (-> new Service).should.throw()
  it 'should create a service', -> (new Service new Channel socket:new net.Socket).should.be.an.instanceof Service
