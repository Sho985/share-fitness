class RemoveColumnToTrainingEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :training_events, :post_id, :integer
  end
end
