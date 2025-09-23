require './lib/hash-map'
require './lib/node'

test = HashMap.new(0.75, 1)

test.get('apple')

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')

puts test.get('apple')
puts test.get('banana')
puts test.get('carrot')

puts test.remove('test')

puts test.remove('banana')

puts test.get('banana')

puts test.get('apple')
puts test.get('carrot')