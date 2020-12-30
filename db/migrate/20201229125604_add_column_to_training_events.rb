class AddColumnToTrainingEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :training_events, :post, foreign_key: true
  end
end
