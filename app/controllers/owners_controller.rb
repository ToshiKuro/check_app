class OwnersController < ApplicationController

  def index
    # binding.pry
    @users = User.all.order(:name)
    @lists = List.all.order(:name)
    @items = Item.all.order(:list_id)
    @ack_user = ''
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

  def acknowledgment
    # render plain: params.inspect
    # binding.pry
    owner = Owner.where(user_id: params[:ack_user].to_i)
    owner.update(acknowledgment: Time.current)
    @owners = Owner.all
    @ack_user = params[:ack_user]
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  def edit
  end

  def update
    render plain: params.inspect
    @owners = Owner.all
    @ack_user = params[:ack_user]
    owner = Owner.find(params[:id])
    if item.update(item_params)
    #   redirect_to owners_index_path
    # else
    #   render 'edit'
    end
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
