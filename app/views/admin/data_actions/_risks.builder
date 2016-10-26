context.instance_eval do
  risks.each do |risk|

    panel "#{risk.activity_type.try(:humanize)} Risk" do
      attributes_table_for risk do
        row :activity_type
        row :description
        row :assessment_completed
        row :likelihood
        row :impact
        row :summary
        row 'Actions' do
          link_to "Edit", edit_admin_risk_path(risk)
        end
      end
    end

  end
end
