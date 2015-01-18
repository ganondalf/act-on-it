class Cause < Keyword

  #----------------------------------------------------------------------
  # associations

  has_and_belongs_to_many :categories, 
                          join_table: 'categories_causes'

end