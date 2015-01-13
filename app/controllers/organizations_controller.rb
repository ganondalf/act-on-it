class OrganizationsController < ApplicationController
  skip_before_filter :very_authenticity_token
  before_action :enable_cross_origin_requests

  def index
    # type_name = params[:type_name]
    org = Organization.first
    render json: org
  end

  def read
  end

  private
  def enable_cross_origin_requests
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Request-Method'] = 'POST'
  end

  # def link_params
  #   params.require(:link).permit(:url, :title, {:note => [:body]})
  # end


  
end