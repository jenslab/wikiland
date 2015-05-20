class WikisController < ApplicationController

before_action :authenticate_user!

  def index
    @wikis = Wiki.public_wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    @title = @wiki.title
    @body = @wiki.body
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    @wiki.private ||= false
    
    if @wiki.save
      redirect_to wikis_path, notice: "Wiki was saved!"
    else
      flash[:error] = "Ooops, couldn't save your wiki."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])

    if @wiki.update_attributes(wiki_params)
      redirect_to wiki_path, notice: "Wiki was updated!"
    else
      flash[:error] = "Ooops, couldn't update the wiki."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      redirect_to wikis_path, notice: "Wiki was deleted!"
    else
      flash[:error] = "Ooops, couldn't delete this wiki."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
