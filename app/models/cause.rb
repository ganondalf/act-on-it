class Cause < ActiveRecord::Base

  validates :cn_id, uniqueness: true
  
end