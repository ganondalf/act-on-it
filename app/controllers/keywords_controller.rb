class KeywordsController < ApplicationController

  # add a type from type name filter before the index method

  def index
    construct_query( normalize_params )
    render json: construct_query( normalize_params )
  end

  protected; def normalize_params
    params.except('action').except('controller')
  end

  protected; def construct_query( params )
    params.each_key do |key|
      return Keyword.where(key.to_sym => params[key])
    end
    Keyword.all
  end

end