class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.references :person, index: true, foreign_key: true
      t.string :code

      t.timestamps null: false
    end
  end
end
