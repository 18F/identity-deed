class Risk < ActiveRecord::Base
  IMPACTS = [
    ["None or TBD", 0],
    ["Very High",   8],
    ["High",        5],
    ["Medium",      3],
    ["Low",         1]
  ]

  LIKELIHOODS = [
    ["High",        5],
    ["Medium",      3],
    ["Low",         1],
    ["Impossible or TBD",  0]
  ]

  ACTIVITY_TYPES = %w(collection retention generation transformation disclosure transmission disposal)

  belongs_to :data_action
  has_one :flow, through: :data_action

  scope :assessed, -> { where(assessment_completed: true) }
  scope :incomplete, -> { where(assessment_completed: false) }

  scope :by_activity, -> (activity) { where(activity_type: activity) }

  def likelihood_label
    LIKELIHOODS.select{|label, n| n == self.likelihood}.first.first
  end

  def impact_label
    IMPACTS.select {|label, n| n == self.impact}.first.first
  end

  after_save :update_data_action_activity_coverage

  def update_data_action_activity_coverage
    data_action.evaluate_activity_coverage
  end


end
