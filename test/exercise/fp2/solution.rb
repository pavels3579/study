module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        for e in self do
          block.call(e)
        end
      end

      # Написать свою функцию my_map
      def my_map(&block)
        new_arr = MyArray.new
        my_each do |e|
          new_arr << block.call(e)
        end

        new_arr
      end

      # Написать свою функцию my_compact
      def my_compact
        new_arr = MyArray.new
        my_each do |e|
          new_arr << e unless e.nil?
        end

        new_arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        acc_given = acc.nil? ? false : true
        index = 0
        my_each do |e|
          acc = if !acc_given && index.zero?
                  self[0]
                else
                  block.call(acc, e)
                end

          index += 1
        end
        acc
      end
    end
  end
end
