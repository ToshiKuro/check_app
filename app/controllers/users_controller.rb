class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    # render plain: params.inspect
    user = User.create(user_params)
    redirect_to action: 'index'
  end

  def edit
    @user = User.find(params[:id])
    # render plain: @user.inspect
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :list1, :list2, :list3, :list4, :list5, :list6, :list7, :list8)
  end

end
