class PagesController < ApplicationController
  def home
		@title = "Home"
		@zone = "Sign in"
  end

  def contact
		@title = "Contact"
		@zone = "Sign in"
  end

  def about
		@title = "About"
		@zone = "Sign in"
  end

  def help
		@title = "Help"
		@zone = "Help"
  end

end
