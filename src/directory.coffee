### @flow ###
path = require 'path'
fs = require 'fs'


###:: stepOnDirectoy :: (string): () => string ###
stepOnDirectoy = (dirPath) ->
  files = fs.readdirSync dirPath
  ->
    file = files.shift()
    return unless file?
    fullPath = path.join dirPath, file
    result = [fullPath, fs.statSync fullPath]


###:: walk :: (string, (string) => void): void ###
walk = (root, callback) ->
  filesIterator = stepOnDirectoy root
  while fileAndStat = filesIterator()
    [file, stat] = fileAndStat
    if stat.isDirectory()
      return walk(file, callback)
    callback.apply null, fileAndStat


module.exports =
  walk: walk
