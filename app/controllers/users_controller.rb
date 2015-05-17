class UsersController < ApplicationController

  def downgrade
    current_user.update_attribute(:role, 'standard')
    redirect_to wikis_path
    flash[:notice] = "Your account was downgraded successfully!"
  end

end
