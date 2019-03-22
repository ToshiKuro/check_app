class ListsController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def show
    @list  = List.find(params[:format])
  end

  def create
    if current_user.try(:admin?)
      list = List.create(list_params)
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
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
      redirect_to action: 'show', name: list.name
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.try(:admin?)
      list = List.find(params[:id])
      list.destroy
      redirect_to action: 'show', name: list.name
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