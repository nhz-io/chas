should = require 'should'
Resource = require '../resource'

describe 'Resource', -> it 'should create resource', -> (new Resource).should.be.an.instanceof Resource
