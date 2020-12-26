class AddColumnToBodyweights < ActiveRecord::Migration[5.2]
  def change
    add_column :bodyweights, :day, :date
  end
end
