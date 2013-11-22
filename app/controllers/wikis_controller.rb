class WikisController < ApplicationController

  def create
    @user = current_user
    @wiki = Wiki.new(params[:wiki])
    @wiki.author = @user
    if @wiki.save
      redirect_to @wiki, notice: "Wiki was saved successfully."
    else
      flash[:error] = "There was a problem saving your wiki. Please try again."
      render :new
    end
  end

  def new
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = Wiki.all
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params[:wiki])
      redirect_to @wiki, notice: "Wiki was updated successfully."
    else
      puts "Error!"
      flash[:error] = "There was an error updating your wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_path
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

end
