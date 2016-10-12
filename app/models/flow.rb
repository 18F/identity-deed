class Flow < ActiveRecord::Base

  has_many :data_actions

  has_many :risks, through: :data_actions

end
