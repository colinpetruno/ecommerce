class Admin::DashboardsController < Admin::BaseController
  def show
    @dashboard = Dashboard.new
  end
end
