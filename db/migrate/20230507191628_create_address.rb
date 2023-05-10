class CreateAddress < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :person
      t.string :street
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :country

      t.timestamps
    end
  end
end
