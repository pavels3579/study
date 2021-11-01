module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        ratings = array.select { |film| film['rating_kinopoisk'].present? }
                       .select { |film| film['rating_kinopoisk'].to_f.positive? }
                       .select { |film| film['country'].present? }
                       .select { |film| film['country'].split(',').length > 1 }
                       .map { |film| film['rating_kinopoisk'].to_f }
        ratings.inject(0, :+) / ratings.length
      end

      def chars_count(films, threshold)
        letter = 'и'
        films.select { |film| film['rating_kinopoisk'].present? }
             .select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .select { |film| film['name'].include?(letter) }
             .map { |film| film['name'] }
             .join('')
             .count(letter)
      end
    end
  end
end
