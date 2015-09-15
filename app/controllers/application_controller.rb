class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :initialize_session

  private

  def initialize_session
    session[:init] = true if Rails.env.test?
  end
end
