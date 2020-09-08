require "jasper_helpers"
require "../reddit_helpers"

class ApplicationController < Amber::Controller::Base
  include JasperHelpers
  include RedditHelpers
  LAYOUT = "application.slang"

  def current_user
    context.current_user
  end
end
