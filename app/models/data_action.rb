class DataAction < ActiveRecord::Base

  belongs_to :flow

  has_many :risks

  def complete_title
    "(#{flow.title}) #{title}"
  end

  default_scope { order('flow_id ASC, id ASC')}

end
