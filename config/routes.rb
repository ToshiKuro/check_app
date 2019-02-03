Rails.application.routes.draw do
  get 'uploader/index'
  get 'uploader/form'
  get 'uploader/upload'
  get 'uploader/download'
  get 'lists/index'
  get 'lists/new'
  get 'lists/show'
  post "lists" => "lists#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
