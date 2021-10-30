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
        return -1 if array.empty? || array.first > query || array.last < query

        size = array.length
        middle = size.even? ? size / 2 - 1 : size / 2

        return middle if array[middle] == query

        if array[middle] > query
          new_arr = array.slice(0..middle - 1)
          search(new_arr, query)
        else
          new_arr = array.slice(middle + 1..size - 1)
          search_index = search(new_arr, query)

          return -1 if search_index == -1

          middle + 1 + search_index
        end
      end
    end
  end
end
