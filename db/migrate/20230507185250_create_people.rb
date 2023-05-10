class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.date :birthdate

      t.timestamps
    end
  end
end
