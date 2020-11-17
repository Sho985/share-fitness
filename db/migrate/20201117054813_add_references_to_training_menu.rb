class AddReferencesToTrainingMenu < ActiveRecord::Migration[5.2]
  def change
    add_reference :training_menus, :post, null: false, foreign_key: true
  end
end
