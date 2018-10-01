class CreateCases < ActiveRecord::Migration[5.2]
  def change
    create_table :cases do |t|
      t.string :name
      t.string :nomis_id
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end
