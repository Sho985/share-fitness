class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :training_menus, :post_id, true
  end
end
