class Animal < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :state, presence: true

  CATEGORIES = ['Big Game','Small Game','Migratory Birds', 'Fur', 'Saltwater Fishing', 'Freshwater Fishing', 'Other']
  file = File.open("states")
  STATES = file.readlines.map(&:chomp)
  file.close

  def self.search(params)
    animals = Animal.all
    animals = animals.where(name: params["name"] ) if params["name"].present?
    animals = animals.where(state: params["state"] ) if params["state"].present?
    animals = animals.where(category: params["category"] ) if params["category"].present?
    return animals
  end
end
