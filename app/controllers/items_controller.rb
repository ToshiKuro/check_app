class ItemsController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
    @lists = List.where(name: params[:name])
    @title = List.find_by(name: params[:name])
  end

  def create
    if current_user.try(:admin?)
      item = Item.create(item_params)
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def edit
    if current_user.try(:admin?)
      @item = Item.find(params[:id])
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def update
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
    if current_user.try(:admin?)
      item = Item.find(params[:id])
      item.destroy
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :list_id, :path, :file)
  end

end
