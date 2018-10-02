class RemoveCaseIdFromSection < ActiveRecord::Migration[5.2]
  def change
    remove_column :sections, :case_id, :integer
  end
end
