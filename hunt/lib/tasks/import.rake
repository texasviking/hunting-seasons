require 'roo'

# To run this task, run the following:
# rake import:animals

namespace :import do
  desc "Import animals from spreadsheet"
  task animals: :environment do
    puts 'Importing Animals...'

     # Open animals spreadsheet
    data = Roo::Spreadsheet.open('lib/data/animals.xlsx')
    headers = data.row(1)
    puts "The data headers are: #{headers}"

    # For each row in the file, create a new animal below:
    numAnimalsAdded = 0
    data.parse.each do |row|

      state = row[0]
      animal = row[1]
      category = row[2]

      if Animal.where(name: animal, state:state, category:category).exists?

      else
        try{
        Animal.create!(name: animal, state: state, category: category)
        numAnimalsAdded+=1
      }

      end
    end
    puts "The number of animals that were added to the database are: #{numAnimalsAdded}"
    puts "The number of animals in the database are: #{Animal.count}"



  end
end
