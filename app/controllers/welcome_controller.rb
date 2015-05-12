class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to wikis_path
    else
      root_path
    end
  end

  def about
  end
end
