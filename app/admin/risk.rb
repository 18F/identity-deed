ActiveAdmin.register Risk do
  menu priority: 3

  permit_params :description, :likelihood, :impact, :summary, :data_action_id,
                :assessment_completed

  form do |f|
    inputs do
      input :data_action, collection: DataAction.all.map {|a| ["#{a.id} #{a.complete_title}", a.id]}
      input :description, as: :text
    end
    inputs 'Assessment' do
      input :assessment_completed
      input :impact, as: :select, collection: Risk::IMPACTS
      input :likelihood, as: :select, collection: Risk::LIKELIHOODS
      input :summary, as: :text
    end
    actions
  end

  index do
    selectable_column
    id_column
    column 'Flow' do |risk|
      link_to risk.flow.title, admin_flow_path(risk.flow)
    end
    column 'Data Action' do |risk|
      link_to risk.data_action.title, admin_data_action_path(risk.data_action)
    end
    column 'Description' do |risk|
      truncate(risk.description)
    end
    column 'Assessment' do |risk|
      tag_type = (risk.impact > 3 ? :error : :ok)
      tag_type = nil if risk.impact <= 1
      status_tag "#{risk.impact_label} IMPACT", tag_type

      tag_type = (risk.likelihood > 3 ? :error : :ok)
      tag_type = nil if risk.likelihood <= 1
      status_tag "#{risk.likelihood_label} LIKELIHOOD", tag_type
    end
    column :assessment_completed
    column :updated_at
    actions
  end

  scope :all
  scope :assessed
  scope :incomplete

  filter :flow
  filter :data_action
  filter :description
  filter :summary
  filter :impact
  filter :likelihood

end
