class AddColumnToTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :training_menus, :training_event, foreign_key: true
  end
end
