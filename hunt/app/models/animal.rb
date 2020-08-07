class Animal < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :state, presence: true

  CATEGORIES = ['Big Game','Small Game','Migratory Birds', 'Fur', 'Saltwater Fishing', 'Freshwater Fishing', 'Other']
  file = File.open("states")
  STATES = file.readlines.map(&:chomp)
  file.close
  STATES.map!(&:upcase)

end
