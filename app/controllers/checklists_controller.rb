class ChecklistsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
    checklist = Checklist.create(checklist_params)
    redirect_to action: 'show'
  end

  private

  def checklist_params
    params.require(:checklist).permit(:name, :item, :address)
  end

end
