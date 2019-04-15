class CreateAsceticPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :ascetic_plans do |t|
      t.integer :ascetic_practice_id
      t.date :date

      t.timestamps
    end
  end
end
