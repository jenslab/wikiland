class UsersController < ApplicationController

  def index
   @wikis = current_user.wikis.public_wikis
  end

  def show
    @wikis = current_user.wikis.private_wikis 
  
    @user = User.find(params[:id])
    @wiki = Wiki.find(params[:id])
    @collab_wiki = @wiki
    @collaborators = @user.collaborators
   
  end

  def downgrade
    current_user.update_attribute(:role, 'standard')

    current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
    
    redirect_to wikis_path
    flash[:notice] = "Your account was downgraded successfully!"
  end

end
