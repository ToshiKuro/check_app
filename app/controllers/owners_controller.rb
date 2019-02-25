class OwnersController < ApplicationController

  def index
    # binding.pry
    @users = User.all.order(:name)
    @lists = List.all.order(:name)
    @items = Item.all.order(:list_id)
  end

  def monitoring
    @owners = Owner.all
  end

  def list_new
  end

  def new
  end

  def show
    @owners = Owner.all
  end

  def create
    # binding.pry
    lists = params[:list].select {|k,v| v == "1" }      #check boxでcheckしたものを抽出
    lists.each do |list|
      owner = Owner.new
      owner.user_id = User.find_by(name: params[:owner][:user]).id
      owner.list_id = List.find_by(name: list[0]).id
      owner.save
    end
    redirect_to owners_show_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def login
  end

  private

  def owner_params
    params.require(:owner).permit(:user, :list)
  end

end
