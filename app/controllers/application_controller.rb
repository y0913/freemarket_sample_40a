class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  layout :layout_by_resource

  private

  def production?
    Rails.env.production?
  end

  def layout_by_resource
    if devise_controller?
      "sub-layout"
    else
      "application"
    end
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'merukari40a'
    end
  end
end
