class SourceController < ApplicationController

  def index
    @select_date = params[:date].nil? ? Time.now.strftime('%Y-%m-%d') : params[:date]
    SourceTable.get_table(@select_date)
    @source = Source.where(col3: @select_date)
    # p @source
  end

end
