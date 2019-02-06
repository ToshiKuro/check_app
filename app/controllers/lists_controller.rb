class ListsController < ApplicationController

  require 'pry'
    # render plain: @list.inspect

  def index
  end

  def new
  end

  def show
    @lists = List.where(name: params[:name])
  end

  def create
    list = List.create(list_params)
    redirect_to action: 'show', name: list.name
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to action: 'show'
    else
      render 'edit'
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to action: 'show', name: list.name
  end

  private

  def list_params
    params.require(:list).permit(:name, :item, :address)
  end

end
