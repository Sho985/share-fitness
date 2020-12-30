class CreateTrainingEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :training_events do |t|
      t.string :event

      t.timestamps
    end
  end
end
