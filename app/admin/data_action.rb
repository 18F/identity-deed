ActiveAdmin.register DataAction do
  menu priority: 2

  permit_params :title, :description, :flow_id

  form do |f|
    inputs do
      input :flow
      input :title
      input :description, as: :text
    end
    actions
  end

  index do
    selectable_column
    id_column
    column 'Title' do |a|
      link_to a.title, admin_data_action_path(a)
    end
    column 'Risks' do |a|
      a.risks.count
    end
    column 'Description' do |a|
      truncate(a.description, length: 100)
    end
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :flow
      row :title
      row :description
      row :created_at
      row :updated_at
      row :id
    end
    panel 'Risks' do
      if data_action.risks.any?
        data_action.risks.each do |risk|
          ul do
            li do
              span do
                link_to("Edit", edit_admin_risk_path(risk)) + " #{risk.description}"
              end
            end
          end
        end
      else
        div "No risks are associated with this Data Action."
      end
      div do
        link_to "New Risk", new_admin_risk_path(data_action_id: data_action.id)
      end
    end
    active_admin_comments
  end


end
