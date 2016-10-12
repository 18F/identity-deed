class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
