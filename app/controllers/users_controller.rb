class UsersController < ApplicationController

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

  def user_list_item
    if params[:item][:name] == 'IJ201'
      @image = '/uploads/upload_file/file/2/NOTAM123.pdf'
    elsif params[:item][:name] == 'IJ202'
      @image = 'http://www.jma.go.jp/jmh/wmapimgs/lrg_00_auas50.png'
    else
      @image = ''
    end
    @user = User.find_by(name: params[:item][:user_name])
    @lists = @user.attributes.values
    @lists.slice!(-2,2)
    @lists.shift(2)
    @lists = @lists.uniq.reject(&:blank?)
    render 'show'
  end

  private

  def user_params
    params.require(:user).permit(:name, :list1, :list2, :list3, :list4, :list5, :list6, :list7, :list8)
  end

end
