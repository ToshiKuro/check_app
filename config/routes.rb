Rails.application.routes.draw do
  get 'checklists/index'
  get 'checklists/new'
  get 'checklists/show'
  post "checklists" => "checklists#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
