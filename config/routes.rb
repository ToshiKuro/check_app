Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/new'
  get 'lists/show'
  get 'lists/create'
  get 'checklists/index'
  get 'checklists/new'
  get 'checklists/show'
  post "checklists" => "checklists#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
