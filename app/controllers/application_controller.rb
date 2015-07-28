class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order
  def current_order
    @order ||= Order.
      find_or_create_by(
        session_id: session.id,
        status: "active"
      )
  end
end
