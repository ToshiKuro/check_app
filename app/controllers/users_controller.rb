class UsersController < ApplicationController

  def index
  end

  def new
  end

  def show
    @user = User.find_by(name: params[:user][:name])
    list_names = @user.attributes.values
    list_names.slice!(-2,2)
    list_names.shift(2)
    list_names = list_names.uniq.reject(&:blank?)
    @items = List.item_select(list_names)
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
    @image = List.find(params[:item][:id].to_i).address
    @user = User.find_by(name: params[:item][:user_name])
    list_names = @user.attributes.values
    list_names.slice!(-2,2)
    list_names.shift(2)
    list_names = list_names.uniq.reject(&:blank?)
    @items = List.item_select(list_names)
    render 'show'
    # redirect_to action: 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
