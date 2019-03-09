class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def show
    @lists = List.where(name: params[:name])
    @title = List.find_by(name: params[:name])
  end

  def create
    item = Item.create(item_params)
    redirect_to owners_index_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # binding.pry
    # render plain: params.inspect
    item = Item.find(params[:id])
    if params[:file].blank?
      item.remove_file!
      item.save
    end
    if item.update(item_params)
      redirect_to owners_index_path
    else
      render 'edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to owners_index_path
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :list_id, :path, :file)
  end

end
