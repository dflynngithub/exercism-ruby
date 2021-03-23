require 'minitest/pride'

class Acronym

    def self.abbreviate(phrase)
        formatted = phrase.delete(',').gsub('-', ' ').split(' ')
        first_letters = formatted.map { |word| word[0].upcase }
        first_letters.join
    end

end
