class CreateDataActions < ActiveRecord::Migration
  def change
    create_table :data_actions do |t|
      t.string :title
      t.string :description
      t.integer :flow_id


      t.timestamps null: false
    end
  end
end
