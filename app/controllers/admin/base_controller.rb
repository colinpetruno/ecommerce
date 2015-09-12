class Admin::BaseController < ApplicationController
  layout "admin"

  before_filter :authorize_admin

  private

  def authorize_admin
    redirect_to root_path unless current_user.site_admin?
  end
end
