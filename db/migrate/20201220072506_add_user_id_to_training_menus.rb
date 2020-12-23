class AddUserIdToTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :training_menus,:user_id,:integer
  end
end
