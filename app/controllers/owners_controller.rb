class OwnersController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
    @title = '＜登録情報＞'
    @users = User.all.order(:name)
    @lists = List.all.order(:name)
    @items = Item.all.order(:list_id)
    @item_id_ck = ''
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
    @title            = '＜運航管理者監視画面＞'
    @select_date_from = params[:date_from].nil? ? Time.now.strftime('%Y-%m-%d') : params[:date_from]
    @select_date_to   = params[:date_to].nil? ? Time.now.strftime('%Y-%m-%d') : params[:date_to]
    @owners           = Owner.where(date: @select_date_from..@select_date_to).order(:date, :user_id, :etd)
    @items_max_number = 0
    @user_id_ck       = ''
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

  def get_source
    select_date_from = DateTime.now - 1
    select_date_to   = DateTime.now + 2
    (select_date_from..select_date_to).each do |date|
      select_date = date.strftime('%Y-%m-%d')
      SourceTable.get_table(select_date)
    end
  end

  private

  def owner_params
    params.require(:owner).permit(:user, :list, :acknowledgment, :fuel, :fl, :msg, :etd, :send_list)
  end

end
