chai = require 'chai'
sinonChai = require 'sinon-chai'
sinon = require 'sinon'
chai.use sinonChai
expect = chai.expect
path = require 'path'
sut = require '../../lib/directory'

describe './lib/directory', ->

  describe '.walk', ->

    beforeEach ->
      @spy = sinon.spy()
      sut.walk __dirname + '/../data', @spy

    it 'calls the given callback with each found file', ->
      fooPath = path.resolve __dirname + '/../data/foo.js'
      barPath = path.resolve __dirname + '/../data/inner/bar.js'
      expect(@spy).to.have.been.calledWith fooPath, sinon.match.any
      expect(@spy).to.have.been.calledWith barPath, sinon.match.any
