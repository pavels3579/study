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
        size = array.length

        return - 1 if size.zero? || array.last < query || array.first > query

        index = get_index(size)

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

      private

      def get_index(size)
        if size == 1
          0
        elsif size.even?
          size / 2 - 1
        else
          size / 2
        end
      end
    end
  end
end
