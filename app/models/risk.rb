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

  belongs_to :data_action
  has_one :flow, through: :data_action

  scope :assessed, -> { where(assessment_completed: true) }
  scope :incomplete, -> { where(assessment_completed: false) }

  def likelihood_label
    LIKELIHOODS.select{|label, n| n == self.likelihood}.first.first
  end

  def impact_label
    IMPACTS.select {|label, n| n == self.impact}.first.first
  end

end
