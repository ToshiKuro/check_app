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
      redirect_to lists_show_path(id: params[:item][:list_id])
    else
      redirect_to owners_list_new_path, notice: 'アクセス権限がありません'
    end
  end

  def edit    
    @title = '＜チェック・リスト編集画面＞'
    if current_user.try(:admin?)
      @item = Item.find(params[:id])
    else
      redirect_to item_edit_path, notice: 'アクセス権限がありません'
    end
  end

  def update
    item = Item.find(params[:id])
    if params[:item][:file].blank?
      item.remove_file!
      item.save
    end
    if item.update(item_params)
      redirect_to lists_show_path(id: item.list_id)
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.try(:admin?)
      item = Item.find(params[:id])
      list_id = item.list_id
      item.destroy
      redirect_to lists_show_path(id: list_id)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def delete_file
    if current_user.try(:admin?)
      list = List.find(params[:id])
      list.items.update_all(file: nil)
      redirect_to lists_show_path(id: list.id)
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def delete_file_all
    if current_user.try(:admin?)
      Item.update_all(file: nil)
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :list_id, :url, :file)
  end

end
