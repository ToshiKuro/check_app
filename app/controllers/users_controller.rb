class UsersController < ApplicationController

  def index
  end

  def new
  end

  def show
    @user = User.find_by(name: params[:user][:name])
    @items = Item.where(list_id: @user.lists).order(:name).group(:path)
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
    # render plain: params.inspect
    @image = Item.find(params[:item][:id]).path
    @user = User.find_by(name: params[:item][:user_name])
    @items = Item.where(list_id: @user.lists).order(:name).group(:path)
    render 'show'
    # respond_to do |format|                                                  #respond_toメソッドで結果をどのフォーマットで返すかを指定
    #   format.html { render :show }
    #   format.js { render :show }
    # end
  end

  def acknowledgment
    @user = User.find_by(name: params[:ack_user])
    @items = Item.where(list_id: @user.lists).order(:name).group(:path)
    owner = Owner.where(user_id: @user.id)
    owner.update(acknowledgment: Time.current)
    respond_to do |format|                                                  #respond_toメソッドで結果をどのフォーマットで返すかを指定
      format.html { render :show }
      format.js { render :show }
    end
  end

  def get_image
    image = Item.find_by(name: params[:image_name]).path
    render json: {image: image}
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
