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

p test.keys

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