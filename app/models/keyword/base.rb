module Keyword

  class Base < ActiveRecord::Base

    # all artifacts are stored in the artifacts table
    self.table_name = 'keywords'

    #----------------------------------------------------------------------
    # associations

    has_many  :charities, inverse_of: :keywords
              inverse_of: :keyword,
              foreign_key: :keyword_id,
              dependent: :destroy

  end

end