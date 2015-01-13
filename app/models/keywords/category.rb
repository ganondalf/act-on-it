class Category < Keyword

  #----------------------------------------------------------------------
  # associations

  has_many :causes, foreign_key: :parent_id

end