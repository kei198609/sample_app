class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
    # => app/views/static_pages/about.html.erb
  end
  
  def  contact
  end
end