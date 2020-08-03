class Animal < ApplicationRecord
    validates :name, :state, :category, presence: true

    file = File.open("states.txt")
    STATES = file.readlines.map(&:chomp)
    file.close
    STATES = STATES.sort.freeze
    CATEGORIES = ['Big Game', 'Fur', 'Small Game', 'Migratory Birds',
      'Freshwater Fishing', 'Saltwater Fishing', 'Other'].freeze


end
