Rails.application.routes.draw do
  get 'uploader/index'
  get 'uploader/form'
  post 'uploader/upload'
  get 'uploader/download'

  get 'lists/index'
  get 'lists/new'
  get 'lists/:name', to: 'lists#show'
  # get 'lists/show/:id', to: 'lists#show', as: 'list_show'
  post 'lists', to: 'lists#create'
  post 'lists/edit', to: 'lists#edit'
  put 'lists', to: 'lists#update'
  delete 'lists/delete/:id', to: 'lists#destroy', as: 'list_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
