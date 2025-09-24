class HashMap
  attr_reader :load_factor, :capacity, :hash_map
  
  def initialize(load_factor, capacity = 16)
    @load_factor = load_factor
    @capacity = capacity
    @hash_map = Array.new(self.capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    return hash_code
  end

  def set(key, value)
    index = hash(key) % self.capacity

    if self.hash_map[index] == nil
      self.hash_map[index] = Node.new(key, value)
    elsif self.hash_map[index].key == key
      self.hash_map[index].value = value
    else
      current_node = get_tail(index)
      current_node.next_node = Node.new(key, value)
    end

    if self.length > (self.capacity * self.load_factor)
      self.grow_capacity
    end
  end

  def grow_capacity
    entries = self.hash_map
    self.initialize(0.75, self.capacity * 2)

    entries.each do |bucket|
      if bucket != nil
        self.set(bucket.key, bucket.value)
        current_node = bucket

        while current_node.next_node != nil
          current_node = current_node.next_node
          self.set(current_node.key, current_node.value)
        end
      end
    end
  end

  def get_tail(index)
    current_node = self.hash_map[index]

    while current_node.next_node != nil
      current_node = current_node.next_node
    end

    return current_node
  end

  def get(key)
    index = hash(key) % self.capacity
    if self.hash_map[index] == nil
      return nil
    elsif self.hash_map[index].key == key
      return self.hash_map[index].value
    else
      current_node = self.hash_map[index]

      while current_node.key != key && current_node.next_node != nil
        current_node = current_node.next_node
      end

      if current_node.key == key
        return current_node.value
      else
        return nil
      end
    end
  end

  def remove(key)
    index = hash(key) % self.capacity

    if self.hash_map[index].key == key && self.hash_map[index].next_node == nil
      return remove_key_return_value(index)
    elsif self.hash_map[index].key != key && self.hash_map[index].next_node != nil
      current_node = self.hash_map[index]
      previous_node = nil

      while current_node.key != key && current_node.next_node != nil
        previous_node = current_node
        current_node = current_node.next_node
      end

      if current_node.key == key && current_node.next_node == nil
        return remove_key_return_value(index)
      elsif current_node.key == key && current_node.next_node != nil
        value = current_node.value
        previous_node.next_node = current_node.next_node
        return value
      else
        return nil
      end
    else
      return nil
    end
  end

  def remove_key_return_value(index)
    value = self.hash_map[index].value
    self.hash_map[index] = nil
    return value
  end

  def length
    count = 0

    self.hash_map.each do |bucket|
      if bucket != nil
        count += 1
        current_node = bucket

        while current_node.next_node != nil
          count += 1
          current_node = current_node.next_node
        end
      end
    end
    return count
  end

  def clear
    self.initialize(0.75)
  end

  def has?(key)
    if get(key) == nil
      return false
    else
      return true
    end
  end
end