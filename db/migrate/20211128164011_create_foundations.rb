class CreateFoundations < ActiveRecord::Migration[6.1]
  def change
    create_table :foundations do |t|
      t.string :name, null: false
      t.belongs_to :lib, null: false, foreign_key: true
      t.integer :books_count, default: 0, null: false
      t.integer :journals_count, default: 0, null: false
      t.integer :newspapers_count, default: 0, null: false
      t.integer :collections_count, default: 0, null: false
      t.integer :dissertations_count, default: 0, null: false
      t.integer :reports_count, default: 0, null: false

      t.timestamps
    end
  end
end
