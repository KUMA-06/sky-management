class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string     :group,    null: false
      t.string     :nickname, null: false
      t.references :tour,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
