class CreateAsceticPractices < ActiveRecord::Migration[5.2]
  def change
    create_table :ascetic_practices do |t|
      t.text :description

      t.timestamps
    end
  end
end
