class Keyword < ActiveRecord::Base

  # all keywords are stored in the keyword table
  self.table_name = 'keywords'

  #----------------------------------------------------------------------
  # associations

  has_and_belongs_to_many :organizations

  #----------------------------------------------------------------------
  # validations

  validates :name, uniqueness: true

end

