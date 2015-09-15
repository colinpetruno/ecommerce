class Store::BaseController < ApplicationController
  layout "store"
  before_action :track_page_view

  helper_method :current_order
  def current_order
    if current_user.present?
      @order ||= Order.
        create_with(session_id: session.id).
        find_or_create_by(
          user_id: current_user.id,
          status: "active"
        )
    else
      @order ||= Order.
        find_or_create_by(
          session_id: session.id,
          status: "active"
        )
    end
  end

  private

  def track_page_view
    PageView.new(
      request: request,
      session: session,
      current_user: current_user,
      user_agent_parser: UserAgentParser,
      uri: URI
    ).track
  end
end
