class UsersController < ApplicationController

  def index
  end

  def new
  end

  def show
    @user = User.find_by(name: params[:user][:name])
  end

  def create
    user = User.create(user_params)
    redirect_to owners_index_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to owners_index_path
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to owners_index_path
  end

  def user_item
    @image = Item.find(params[:item][:id]).path
    @user = User.find_by(name: params[:item][:user_name])
    # @items = List.item_select(list_names)
    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
