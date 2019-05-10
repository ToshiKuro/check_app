class UsersController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
    @select_date_pic = params[:date_pic].nil? ? Time.now.strftime('%Y-%m-%d') : params[:date_pic][:date_pic]
    @users = Owner.where(date: @select_date_pic).pluck(:user_id)
    render layout: 'normal'
  end

  def new
  end

  def show
    @select_date_pic = params[:user][:date_pic]
    @user = User.find(params[:user][:id])
    owner = Owner.where(date: params[:user][:date_pic], user_id: params[:user][:id])
    @lists = List.where(id: owner.pluck(:list_id)).distinct
    @items = Item.where(list_id: owner.pluck(:list_id)).distinct
    item_file = @items.select(:file)
    item_url  = @items.select(:url)

    items_ck = []

    item_file.each do |item|
      if !item[:file].blank?
        items_ck << @items.find_by(file: item[:file])
      end
    end

    item_url.each do |item|
      if !item.url.blank?
        items_ck << @items.find_by(url: item.url)
      end
    end

    @items_ck = items_ck.sort_by {|name| name.name}
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
    owners = Owner.where(user_id: @user.id, date: params[:date])
    owners.each do |owner|
      owner.update(acknowledgment: Time.current,
        pln_num: params["#{owner.list_id}"][:pln_num],
        fuel: params["#{owner.list_id}"][:fuel],
        fl: params["#{owner.list_id}"][:fl],
        msg: params[:msg])
    end
    respond_to do |format|                                                  #respond_toメソッドで結果をどのフォーマットで返すかを指定
      format.html { render :show }
      format.js { render :show }
    end
  end

  def get_image
    image_id = params[:id][/button(.*)/,1].to_i
    image = Item.find(image_id)
    if image[:file].blank?
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

end
