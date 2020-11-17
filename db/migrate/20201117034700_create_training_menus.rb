class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.string :part
      t.string :event
      t.integer :weight
      t.integer :repetition
      t.integer :set_count

      t.timestamps
    end
  end
end
