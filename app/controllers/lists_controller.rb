class ListsController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
    @list = params[:id].nil? ? List.first : List.find(params[:id])
    @items = @list.items.order(:id)
    @title = "<#{@list.name} チェク・リスト>"
  end

  def create
    if current_user.try(:admin?)
      list = List.create(list_params)
      redirect_to owners_index_path
    else
      redirect_to owners_list_new_path
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def edit
    if current_user.try(:admin?)
      @list = List.find(params[:id])
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to lists_show_path
      redirect_to action: 'show', name: list.name
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.try(:admin?)
      owner = Owner.where(list_id: params[:id])
      owner.destroy_all
      item  = Item.where(list_id: params[:id])
      item.destroy_all
      list  = List.find(params[:id])
      list.destroy
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  private

  def list_params
    params.require(:list).permit(:id, :name, :item, :address)
  end

end