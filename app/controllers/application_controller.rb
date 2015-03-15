class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include BasicAuthConcern
  include SimpleBreadcrumbs

  before_action do
    add_breadcrumb_top if controller_name != 'welcome'
  end

end
