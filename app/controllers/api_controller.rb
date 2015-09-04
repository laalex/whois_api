class ApiController < ApplicationController
  include ApiHelper
  before_action :allow_access


  def show
  end

  def raw
    data = get_whois_raw(params[:dns])
    render html: data
  end

  def whois
    data = get_whois_data(params[:dns])
    render json: data
  end

  private
    def allow_access
      if !ApiKey.is_valid?(params[:token], params[:api_key])
        render :status => :forbidden, :text => "API Access not permitted using your credentials"
      end

    end

end
