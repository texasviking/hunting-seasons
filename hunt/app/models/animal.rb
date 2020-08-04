class Animal < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :state, presence: true
  $CATEGORIES = ['Big Game','Small Game','Migratory Birds', 'Fur', 'Saltwater Fishing', 'Freshwater Fishing']


  $STATES = []
  File.readlines("states").each do |state|
    $STATES.append(state)
  end


end
