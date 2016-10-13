class AddDataActionActivities < ActiveRecord::Migration
  def change
    checklist = %w(collection retention generation transformation disclosure transmission disposal)
    checklist.each do |checkbox|
      add_column :data_actions, checkbox, :boolean
    end
  end
end
