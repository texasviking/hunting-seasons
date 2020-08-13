class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :category
      t.string :state
      t.text :description
      t.date :season_open
      t.date :season_close

      t.timestamps
    end
  end
end
