class CreateReplenishments < ActiveRecord::Migration[6.1]
  def change
    create_table :replenishments do |t|
      t.belongs_to :foundation, null: false, foreign_key: true
      t.belongs_to :employee, null: false, foreign_key: true
      t.string :name, null: false
      t.belongs_to :type, null: false, foreign_key: true
      t.string :publisher, null: false
      t.integer :items_count, null: false

      t.timestamps
    end
  end
end
