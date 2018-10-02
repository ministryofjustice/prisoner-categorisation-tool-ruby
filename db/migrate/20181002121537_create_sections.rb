class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :serialized_text
      t.references :case, foreign_key: true

      t.timestamps
    end
  end
end
