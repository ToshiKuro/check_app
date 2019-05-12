class SourceController < ApplicationController

  # ログインしているユーザーにのみ権限を与える
  before_action :authenticate_user!

  def index
    @title = '＜運航情報＞'
    if params[:date].nil?
      @select_date = Time.now.strftime('%Y-%m-%d')
    else
      @select_date = params[:date]
      SourceTable.get_table(@select_date)
    end
    @source = Source.where(col3: @select_date).order(:col4, :col8)
    render 'index'
  end

end