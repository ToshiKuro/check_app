Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/new'
  get 'lists/show'
  post "lists" => "lists#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
