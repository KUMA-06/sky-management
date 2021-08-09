class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :dining
      t.string :dinner_wait
      t.string :dinner_preparation
      t.string :bath_time
      t.string :bath_wait
      t.string :escape
      t.references :tour,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
