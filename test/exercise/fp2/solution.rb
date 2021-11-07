module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?

        head, *tail = self
        block.call(head)
        new_arr = MyArray.new(tail)
        new_arr.my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) do |acc, item|
          acc << block.call(item)
          acc
        end
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |acc, item|
          acc << item unless item.nil?
          acc
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        head, *tail = self

        new_arr = MyArray.new(tail)

        if acc.nil?
          new_arr.my_reduce(first, &block)
        else
          new_acc = block.call(acc, head)
          new_arr.my_reduce(new_acc, &block)
        end
      end
    end
  end
end
