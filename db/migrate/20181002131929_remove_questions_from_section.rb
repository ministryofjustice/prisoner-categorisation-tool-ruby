class RemoveQuestionsFromSection < ActiveRecord::Migration[5.2]
  def change
    remove_column :sections, :questions, :string
  end
end
