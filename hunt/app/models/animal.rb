class Animal < ApplicationRecord

  validates :name, :state, :category, presence: true
    $STATES = Array.new()

    File.readlines("states.txt").each do |line|
      $STATES.push line
    end

    $CATEGORIES = ["Big Game", "Furbearer", "Small Game", "Migratory Birds", "Freshwater Fish", "Saltwater Fish"]
    $STATES.sort

end
