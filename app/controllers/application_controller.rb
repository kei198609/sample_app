class ApplicationController < ActionController::Base
  def hello
    render html: "helloooo, world!"
  end
end
