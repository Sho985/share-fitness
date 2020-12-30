class AddReferencesToTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :training_menus, :post, foreign_key: true
  end
end
