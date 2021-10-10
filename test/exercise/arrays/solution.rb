module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.inject do |acc, item|
          acc > item ? acc : item
        end

        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query, acc = 0)
        size = array.length

        return - 1 if size.zero? || array.last < query || array.first > query

        index = if size == 1
                  0
                elsif size.even?
                  size / 2 - 1
                else
                  size / 2
                end

        return acc + index if array[index] == query

        if array[index] > query
          new_arr = array.slice(0..index)

          return search(new_arr, query, acc)
        end

        if array[index] < query
          new_arr = array.slice(index + 1..size - 1)
          delta = size - new_arr.length

          return search(new_arr, query, acc + delta)
        end
        -1
      end
    end
  end
end
