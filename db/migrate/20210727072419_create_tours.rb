class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string       :place, null: false
      # t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
