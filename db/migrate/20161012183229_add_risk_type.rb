class AddRiskType < ActiveRecord::Migration
  def change
    add_column :risks, :activity_type, :string
  end
end
