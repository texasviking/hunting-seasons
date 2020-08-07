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
    #puts "The data headers are: #{headers}"

    # For each row in the file, create a new animal below:

    num_animals = 0

    data.each_with_index do |row, index|
      next if index == 0

      if Animal.exists?(state: row[0].to_s.titleize,
        name: row[1].to_s.titleize, category: row[2].to_s)
        next
      end

      Animal.create!(state: row[0].to_s.titleize,
        name: row[1].to_s.titleize, category: row[2].to_s)
      num_animals += 1
    end

    puts "Done"
    puts "#{num_animals} animals were imported."
  end
end
