class AddQuestionsToSection < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :questions, :string
  end
end
