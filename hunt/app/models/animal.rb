class Animal < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :state, presence: true
  $CATEGORIES = ['big game','small game','migratory birds', 'fur', 'saltwater fishing', 'freshwater fishing']


  $STATES = []
  File.readlines("states").each do |state|
    $STATES.append(state)
  end


end
