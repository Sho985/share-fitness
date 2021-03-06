class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :category
      t.text :question_content
      t.string :question_image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
