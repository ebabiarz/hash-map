require './lib/hash-map'
require './lib/node'

test = HashMap.new(0.75)

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.entries
puts test.length
puts test.capacity

test.set('apple', 'green')
test.set('dog', 'black')
test.set('hat', 'purple')

p test.entries
puts test.length
puts test.capacity

test.set('moon', 'silver')

p test.entries
puts test.length
puts test.capacity

test.set('moon', 'gray')
test.set('lion', 'yellow')
test.set('grape', 'green')

p test.entries
puts test.length
puts test.capacity

puts ""
puts ""

puts test.get('moon')
puts test.has?('grape')
puts test.remove('lion')
puts test.length
puts test.keys
puts test.values

test.clear

puts test.length
puts test.capacity

# puts test.get('apple')
# puts test.get('banana')
# puts test.get('carrot')
# puts test.get('dog')
# puts test.get('elephant')
# puts test.get('frog')
# puts test.get('grape')
# puts test.get('hat')
# puts test.get('ice cream')
# puts test.get('jacket')
# puts test.get('kite')
# puts test.get('lion')

# puts test.capacity
# puts test.hash_map.length
# puts test.load_factor