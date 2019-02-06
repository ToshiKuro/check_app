class ListsController < ApplicationController

  require 'pry'
    # render plain: @list.inspect

  def index
  end

  def new
  end

  def show
    @lists = List.where(name: params[:name])
    @title = List.find_by(name: params[:name])
    # render plain: @title.name.inspect
  end

  def create
    # render plain: params.inspect
    list = List.create(list_params)
    # render 'show'
    # render plain: list.name.inspect
    redirect_to action: 'show', name: list.name
  end

  def edit
    # render plain: params.inspect
    @list = List.find(params[:id])
    # render plain: @list.inspect
  end

  def update
    # render plain: params.inspect
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to action: 'show', name: list.name
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
    params.require(:list).permit(:id, :name, :item, :address)
  end

end

    # if @list.update(list_params)
    #   redirect_to action: 'show'
    # else
    #   render 'edit'
    # end