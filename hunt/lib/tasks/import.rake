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

  end
end