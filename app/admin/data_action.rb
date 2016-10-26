ActiveAdmin.register DataAction do
  menu priority: 2

  permit_params :title, :description, :flow_id,
                :collection, :retention, :generation, :transformation,
                :disclosure, :transmission, :disposal

  form do |f|
    inputs do
      input :flow
      input :title
      input :description, as: :text
      Risk::ACTIVITY_TYPES.each do |activity|
        input activity.intern
      end
    end
    actions
  end

  index do
    selectable_column
    id_column
    column 'Flow' do |a|
      if a.flow
        link_to a.flow.title, admin_flow_path(a.flow)
      else
        span "?"
      end
    end
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
      row :all_activities_covered
      list_row :undefined_activities unless data_action.all_activities_covered
      row :created_at
      row :updated_at
      row :id
      row 'Actions' do
        link_to "Add New Risk", new_admin_risk_path(data_action_id: data_action.id)
      end
    end

    if data_action.risks.any?
      render "admin/data_actions/risks", risks: data_action.risks, context: self
    else
      div "No risks are associated with this Data Action."
    end
    active_admin_comments
  end

  scope :all
  scope :covered

  action_item :add_risk, only: [:show] do
    link_to "Add Risk", new_admin_risk_path(data_action_id: data_action.id)
  end

  sidebar "Instructions", only: [:edit, :new] do
    ul do
      li "Prompts, and"
      li "other things to consider."
    end
  end

end
