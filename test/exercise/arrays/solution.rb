module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.inject do |acc, item|
          acc > item ? acc : item
        end

        array.map { |item| item.positive? ? max : item }
      end

      def search(array, query)
        return - 1 unless array.include?(query)

        size = array.length

        index = if size == 1
                  0
                elsif size.even?
                  size / 2 - 1
                else
                  size / 2
                end

        return index if array[index] == query

        if array[index] > query
          new_arr = array.slice(0..index)

          return search(new_arr, query)
        end

        if array[index] < query
          new_arr = array.slice(index + 1..size - 1)
          result = search(new_arr, query)

          return result if result == -1

          return size - new_arr.length + result
        end
        -1
      end
    end
  end
end
