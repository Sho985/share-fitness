class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :part
      t.string :discipline
      t.string :weight
      t.string :number
      t.string :comment
      t.string :image

      t.timestamps
    end
  end
end
