require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'show' do
    it '正しいuserとlistが取れること' do
      name = 'aaaa'
      user1 = create(:user, name: name)
      user2 = create(:user)
      list1 = create(:list)
      list2 = create(:list)
      create(:owner, user: user1, list: list1)
      create(:owner, user: user2, list: list2)
      item1 = create(:item, list: list1)
      item2 = create(:item, list: list2)

      get :show, params: {user: {name: name}}

      expect(assigns(:user)).to eq user1
      expect(assigns(:items)).to eq [item1]
    end
  end

end


    # @user = User.find_by(name: params[:user][:name])
    # @items = Item.where(list_id: @user.lists).order(:name).group(:path)
