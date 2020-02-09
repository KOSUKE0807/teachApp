class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :detail, null: false
      t.date :date
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
