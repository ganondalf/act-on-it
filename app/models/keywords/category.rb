class Category < Keyword

  #----------------------------------------------------------------------
  # associations

  has_and_belongs_to_many :causes, 
                          join_table: 'categories_causes'


end