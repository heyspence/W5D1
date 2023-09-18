class Cache_node
    attr_accessor :value, :next

    def initialize(value, next = nil, prev = nil, first = nil, last = nil)
        @value = value
        @next = nil
        @prev = prev
        @last = last
        @first = first
    end

end