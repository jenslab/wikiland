class CollaboratorsController < ApplicationController

def create
@wiki = Wiki.find(params[:wiki_id])
@user = User.find(params[:user_id])

@collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: @user.id)

  if @collaborator.save
    redirect_to edit_wiki_path(@wiki), notice: "Collaborator was added!"
  else
    flash[:error] = "Ooops, couldn't add the collaborator."
    render :edit
  end
end

def destroy
  @wiki = Wiki.find(params[:wiki_id])
  @user = User.find(params[:user_id])

  @collaborator = Collaborators.find(params[:id])

  if @collaborator.destroy
    flash[:notice] = "Collaborator was removed."
    redirect_to wiki_path
  else
    flash[:error] = "Ooops, couldn't add the collaborator."
    render :edit
  end

end

end