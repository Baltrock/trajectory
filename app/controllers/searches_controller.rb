class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]
  def new
    @search = Search.new
    @users = User.all
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
  end

  def edit
  end

  def update
    @search.update_attributes(search_params)
    redirect_to @search
  end

  def destroy
    @search.destroy
    redirect_to root_path
  end

  private

  def search_params
    params.require(:search).permit(:title, :description, :url)
  end

  def set_search
    @search = Search.find(params[:id])
  end
end
