# idk why test_discard_array fails
# when everything else passes
class Array
  def keep &block
    each_with_index do |item, index|
      delete_at index  unless yield item
    end
  end

  def discard &block
    each_with_index do |item, index|
      delete_at index if yield item
    end
  end
end
