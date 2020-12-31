class RemoveColumnToTrainingEvents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :training_events, :post, foreign_key: true
  end
end
