require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe '#valid?' do

    # For the validation tests, assign an invalid value
    # and ensure that the record is not valid and that
    # the specific error message is returned

    it "is not valid without a name" do
      animal = Animal.new(name: nil)
      expect(animal).to_not be_valid
      expect(animal.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a state" do
      animal = Animal.new(state: nil)
      expect(animal).to_not be_valid
      expect(animal.errors.full_messages).to include("State can't be blank")
    end

    it "is not valid without a category" do
      animal = Animal.new(category: nil)
      expect(animal).to_not be_valid
      expect(animal.errors.full_messages).to include("Category can't be blank")
    end

    it "is not valid without a state in the STATES list" do
      animal = Animal.new(state: "London")
      expect(animal).to_not be_valid
      expect(animal.errors.full_messages).to include("State is not included in the list")
    end

    it "is not valid without a state in the CATEGORIES list" do
      animal = Animal.new(category: "Big Fur")
      expect(animal).to_not be_valid
      expect(animal.errors.full_messages).to include("Category is not included in the list")
    end
  end

  describe '.search' do
    before(:all) do
      Animal.create(name: 'Alligator', state: 'Alabama', category: 'Big Game')
      Animal.create(name: 'Alligator', state: 'Florida', category: 'Big Game')
      Animal.create(name: 'Black Bear', state: 'Georgia', category: 'Big Game')
      Animal.create(name: 'Canada Goose', state: 'Florida', category: 'Migratory Birds')
    end

    after(:all) do
      DatabaseCleaner.clean_with(:truncation)
    end

    it "returns animals filtered by name" do
      # write a test that calls the search with "name" => "Alligator"
      # and tests that only two records are returned
      animals = Animal.search({"name" => "Alligator"})
      expect(animals.count).to equal 2
    end

    it "returns animals filtered by state" do
      animals = Animal.search({"state" => "Florida"})
      expect(animals.count).to equal 2
    end

    it "returns animals filtered by category" do
      animals = Animal.search({"category" => "Big Game"})
      expect(animals.count).to equal 3
    end

    it "returns animals filtered by name, state, and category" do
      # write a test that calls the search with all three parameters
      # and ensure that only one record is returned
      animals = Animal.search({"name" => "Alligator", "state" => "Alabama", "category" => "Big Game"})
      expect(animals.count).to equal 1
    end
  end
end
