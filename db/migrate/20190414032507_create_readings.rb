class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.date :date
      t.text :text

      t.timestamps
    end
  end
end
