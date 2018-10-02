class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :serialized_answers
      t.references :case, foreign_key: true
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
