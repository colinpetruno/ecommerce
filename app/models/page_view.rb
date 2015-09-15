class PageView < ActiveRecord::Base
  belongs_to :user

  attr_accessor :request, :session, :current_user, :user_agent_parser, :uri

  def track
    set_browser_details
    set_referrer
    set_references
    set_utm
    set_page_details

    save
  end

  private

  def set_page_details
    self.page_url = uri_details.path
    self.page_parameters = uri_details.query
  end

  def params
    request.params
  end

  def set_utm
    self.utm_source = params[:utm_source]
    self.utm_medium = params[:utm_medium]
    self.utm_term = params[:utm_term]
    self.utm_content = params[:utm_content]
    self.utm_campaign = params[:utm_campaign]
  end

  def set_references
    self.user_id = current_user.try(:id)
    self.session_id = session.id
  end

  def set_referrer
    self.referrer = request.referrer
    self.ip_address = request.remote_ip
  end

  def uri_details
    @uri_details ||= uri.parse(request.url)
  end

  def user_agent_details
    @user_agent_details ||= user_agent_parser.parse(request.user_agent)
  end

  def set_url_details
    self.page_url = uri_details.path
    self.page_parameters = uri_details.query
  end

  def set_browser_details
    self.browser = user_agent_details.family

    if user_agent_details.version.present?
      self.browser_version = user_agent_details.version.to_s
      self.browser_major_version = user_agent_details.version.major.to_s
    end

    self.user_agent = request.user_agent
    self.operating_system = user_agent_details.os.to_s
  end
end
