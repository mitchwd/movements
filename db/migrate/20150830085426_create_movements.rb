class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.references :person, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
