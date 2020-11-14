class RemoveColumnInPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :part, :string
    remove_column :posts, :discipline, :string
    remove_column :posts, :weight, :string
    remove_column :posts, :number, :string
  end
end
