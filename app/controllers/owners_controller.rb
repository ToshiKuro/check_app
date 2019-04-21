class OwnersController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
    @title = '＜登録情報＞'
    @users = User.all.order(:name)
    @lists = List.all.order(:name)
    @items = Item.all.order(:list_id)
  end

  def monitoring
    @owners = Owner.all
  end

  def list_new
    @title = '＜新規登録＞'
  end

  def new
    @title = '＜PIC搭乗便登録＞'
  end

  def show
    @title = '＜運航管理者監視画面＞'
    @owners = Owner.all
    @items_max_number = 0
    @user_id_ck = ''
    @owners.each do |owner|
      if @items_max_number < List.find(owner.list_id).items.count
        @items_max_number = List.find(owner.list_id).items.count
      end
    end
  end

  def create
    if current_user.try(:admin?)
      lists = params[:name].select {|k,v| v == "1" }      #check boxでcheckしたものを抽出
      lists.each do |list|
        owner = Owner.new
        owner.user_id = params[:owner][:id]
        owner.list_id = List.find_by(name: list[0]).id
        owner.save
      end
      redirect_to owners_show_path
    else
      redirect_to owners_new_path, notice: 'アクセス権限がありません'
    end
  end

  def acknowledgment
  end

  def edit
  end

  def update
    if current_user.try(:admin?)
      @owners = Owner.all
      @ack_user = params[:ack_user]
      owner = Owner.find(params[:id])
      if item.update(item_params)
        redirect_to owners_index_path
      else
        render 'edit'
      end
    else
      redirect_to owners_update_path, notice: 'アクセス権限がありません'
    end
  end

  def destroy
  end

  def login
  end

  private

  def owner_params
    params.require(:owner).permit(:user, :list, :acknowledgment, :fuel, :fl, :msg, :etd, :send_list)
  end

end
