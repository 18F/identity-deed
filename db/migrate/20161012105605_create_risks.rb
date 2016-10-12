class CreateRisks < ActiveRecord::Migration
  def change
    create_table :risks do |t|
      t.string :description
      t.integer :likelihood, default: 0
      t.integer :impact, default: 0
      t.string :summary
      t.boolean :assessment_completed
      t.integer :data_action_id

      t.timestamps null: false
    end
  end
end
