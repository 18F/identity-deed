class Coverage < ActiveRecord::Migration
  def change
    add_column :data_actions, :all_activities_covered, :boolean
  end
end
