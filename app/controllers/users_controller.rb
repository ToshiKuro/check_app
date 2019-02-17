class UsersController < ApplicationController

  require 'pry'

  def index
  end

  def new
  end

  def show
    @user = User.find_by(name: params[:user][:name])
    @lists = @user.attributes.values
    @lists.slice!(-2,2)
    @lists.shift(2)
    @lists = @lists.uniq.reject(&:blank?)
    @items = List.where(name: @lists)
    # @items = List.where(name: @lists).select(:address).distinct
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
    @lists = @user.attributes.values
    @lists.slice!(-2,2)
    @lists.shift(2)
    @lists = @lists.uniq.reject(&:blank?)
    @items = List.where(name: @lists)
    render 'show'
    # redirect_to action: 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name, :list1, :list2, :list3, :list4, :list5, :list6, :list7, :list8)
  end

end
