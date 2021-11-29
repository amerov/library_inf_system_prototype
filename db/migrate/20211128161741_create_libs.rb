class CreateLibs < ActiveRecord::Migration[6.1]
  def change
    create_table :libs do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
