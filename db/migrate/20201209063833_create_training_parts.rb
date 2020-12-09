class CreateTrainingParts < ActiveRecord::Migration[5.2]
  def change
    create_table :training_parts do |t|
      t.string :part
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
