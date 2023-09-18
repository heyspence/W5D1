
class LRUCache
    attr_reader :cache

    @@cache_size = 0

    def initialize(length)
        @@cache_size = length
        @cache = []
    end


    def count
        cache.length
    end


    def add(ele)
        unless include?(ele)
            if full?
                remove
            end
            cache << ele
        else
            move_to_end(ele)
        end
    end


    def show
      p cache
    end


    private
    def full?
        count == @@cache_size
    end


    def remove
        cache.shift
    end


    def include?(ele)
        cache.include?(ele)
    end

    def move_to_end(ele)
        index = cache.index(ele) 
        cache.delete_at(index)
        cache << ele
    end
  end



  
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]