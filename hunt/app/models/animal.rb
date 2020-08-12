class Animal < ApplicationRecord
  validates :name, presence: true

  CATEGORIES = ['Big Game','Small Game','Migratory Birds', 'Fur', 'Saltwater Fishing', 'Freshwater Fishing', 'Other']
  file = File.open("states")
  STATES = file.readlines.map(&:chomp)
  file.close

  validates :state, presence: true, inclusion: STATES
  validates :category, presence: true, inclusion: CATEGORIES

  def self.search(params)
    animals = Animal.all
    animals = animals.where(name: params["name"].titleize) if params["name"].present?
    animals = animals.where(state: params["state"]) if params["state"].present?
    animals = animals.where(category: params["category"]) if params["category"].present?
    return animals
  end

end
