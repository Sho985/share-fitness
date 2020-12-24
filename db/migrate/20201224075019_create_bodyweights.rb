class CreateBodyweights < ActiveRecord::Migration[5.2]
  def change
    create_table :bodyweights do |t|
      t.integer :bodyweight
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
