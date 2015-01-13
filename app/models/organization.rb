class Organization < ActiveRecord::Base

  # all organizations are stored in the organizations table
  self.table_name = 'organizations'

  has_and_belongs_to_many :keywords

  # -------------------------
  store_accessor  :cn_data,    :overall_score
  store_accessor  :cn_data,    :overall_rating
  store_accessor  :cn_data,    :description
  store_accessor  :cn_data,    :mission
  store_accessor  :cn_data,    :charity_name
  store_accessor  :cn_data,    :cause
  store_accessor  :cn_data,    :category
  store_accessor  :cn_data,    :causeid
  store_accessor  :cn_data,    :categoryid

  # -------------------------
  validates :ein, uniqueness: true, presence: true

end
