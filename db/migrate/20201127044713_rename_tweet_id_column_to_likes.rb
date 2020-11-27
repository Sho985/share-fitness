class RenameTweetIdColumnToLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :tweet_id, :post_id
  end
end
