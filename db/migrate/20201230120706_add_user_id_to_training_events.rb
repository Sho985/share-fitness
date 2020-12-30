class AddUserIdToTrainingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :training_events,:user_id,:integer
  end
end
