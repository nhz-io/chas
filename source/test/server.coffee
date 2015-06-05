should = require 'should'
Server = require '../server'

describe 'Server', -> it 'should create server', -> (new Server).should.be.an.instanceof Server
