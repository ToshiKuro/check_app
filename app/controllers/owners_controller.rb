class OwnersController < ApplicationController

  def index
    @users = User.all
    @users = List.all
    @users = Item.all
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def login
  end

end
