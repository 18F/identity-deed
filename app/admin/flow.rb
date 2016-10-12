ActiveAdmin.register Flow do
  menu priority: 1

  permit_params :title, :description

  form do |f|
    inputs do
      input :title
      input :description, as: :text
    end
    actions
  end


  index do
    selectable_column
    id_column
    column :title
    column :description
    column :updated_at
    column 'Data Actions' do |flow|
      flow.data_actions.count
    end
    column 'Risks Assessed' do |flow|
      flow.risks.assessed.count
    end
    actions
  end

end
