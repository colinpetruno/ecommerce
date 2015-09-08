class Admin::PageViewsController < Admin::BaseController
  def index
    @page_views = PageView.all.order("created_at DESC")
  end

  def show
    @page_view = PageView.find(params[:id])
  end
end
