class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.belongs_to :lib, null: false, foreign_key: true
      t.string :position
      t.date :birthdate
      t.date :joined_at
      t.string :education
      t.integer :salary

      t.timestamps
    end
  end
end
