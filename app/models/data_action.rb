class DataAction < ActiveRecord::Base

  belongs_to :flow

  has_many :risks

  def complete_title
    "(#{flow.title}) #{title}"
  end

  default_scope { order('flow_id ASC, id ASC')}

  scope :covered, -> { where(all_activities_covered: true)}

  after_save :evaluate_activity_coverage

  def evaluate_activity_coverage
    update_column(:all_activities_covered, undefined_activities.empty?)
  end

  def expected_activities
    Risk::ACTIVITY_TYPES.select { |a| self[a.intern] }
  end

  def defined_activities
    risks.all.pluck(:activity_type).compact.uniq
  end

  def undefined_activities
    expected_activities - defined_activities
  end

end
