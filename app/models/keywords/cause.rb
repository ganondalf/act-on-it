class Cause < Keyword

  #----------------------------------------------------------------------
  # associations

  belongs_to :category, foreign_key: :child_id

  # validations

end