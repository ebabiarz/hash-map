class HashMap
  attr_accessor :load_factor, :capacity, :hash_map
  
  def initialize(load_factor, capacity = 16)
    @load_factor = load_factor
    @capacity = capacity
    @hash_map = Array.new(self.capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash_code = hash(key)
    index = hash_code % self.capacity

    if self.hash_map[index] == nil
      self.hash_map[index] = Node.new(key, value)
    elsif self.hash_map[index].key == key
      self.hash_map[index].value = value
    else
      current_node = self.hash_map[index]

      while current_node.next_node != nil
        current_node = current_node.next_node
      end

      current_node.next_node = Node.new(key, value)
    end
  end
end