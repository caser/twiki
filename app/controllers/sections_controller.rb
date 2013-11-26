class SectionsController < ApplicationController
  def create
    puts params.inspect
    @section = Section.new(params[:section])
    @wiki = Wiki.find(params[:wiki_id])
    @section.wiki = @wiki
    @section.author = current_user
    if @section.save
      redirect_to @section, message: "Section saved successfully."
    else
      flash[:error] = "Error saving section. Please try again with valid data."
      render :new
    end
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      redirect_to @section, message: "Section saved successfully."
    else
      flash[:error] = "Error saving section. Please try again with valid data."
      render :edit
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to sections_path
  end

  def edit
    @section = Section.find(params[:id])
  end
end
