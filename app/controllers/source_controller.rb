class SourceController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
    @title = '＜運航情報＞'
    @select_date = params[:date].nil? ? Time.now.strftime('%Y-%m-%d') : params[:date]
    # SourceTable.get_table(@select_date)
    @source = Source.where(col3: @select_date)
    render 'index'
  end

end
