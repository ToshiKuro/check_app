class ListsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    list = List.create(list_params)
    redirect_to action: 'show'
  end

  private

  def list_params
    params.require(:list).permit(:name, :item, :address)
  end

end
