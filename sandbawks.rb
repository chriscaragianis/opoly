require 'json'

file = File.open('board.json', 'r')
contents = file.read
#ruby_contents = JSON.parse(contents)
puts contents
