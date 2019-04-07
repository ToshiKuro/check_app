class UsersController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
    render layout: 'normal'
  end

  def new
  end

  def show
    @user = User.find(params[:user][:id])
    items = Item.where(list_id: @user.lists).distinct
    item_file = items.group(:file)
    item_url  = items.group(:url)
    item_select = item_file + item_url
    @items = []
    
    item_select.uniq.each do |item|
      if !item.file.blank?
        @items << item
      elsif item.file.blank? && !item.url.blank?
        @items << item
      end
    end

    render layout: 'normal'
  end

  def create
    if current_user.try(:admin?)
      user = User.create(user_params)
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def edit
    if current_user.try(:admin?)
      @user = User.find(params[:id])
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def update
    if current_user.try(:admin?)
      user = User.find(params[:id])
      if user.update(user_params)
        redirect_to owners_index_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    if current_user.try(:admin?)
      owner = Owner.where(user_id: params[:id])
      owner.destroy_all
      user = User.find(params[:id])
      user.destroy
      redirect_to owners_index_path
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = 'アクセス権限がありません'
    end
  end

  def user_item
    @image = Item.find(params[:item][:id]).path
    @user = User.find_by(name: params[:item][:user_name])
    @items = Item.where(list_id: @user.lists).order(:name).group(:path)
    render 'show'
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
    image = Item.find_by(name: params[:image_name])
    if image.file.blank?
      image = image.url
    else
      image = image.file.url
    end
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
