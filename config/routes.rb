Rails.application.routes.draw do

  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'owners/index'
  get 'owners/new'
  get 'owners/show'
  get 'owners/create'
  get 'owners/edit'
  get 'owners/update'
  get 'owners/destroy'
  get    'lists',          to: 'lists#index'
  get    'lists/new',      to: 'lists#new'
  get    'lists/:name',    to: 'lists#show'
  post   'lists',          to: 'lists#create'
  get    'lists/:id/edit', to: 'lists#edit',    as: 'list_edit'
  patch  'lists/:id',      to: 'lists#update',  as: 'list_update'
  delete 'lists/:id',      to: 'lists#destroy', as: 'list_delete'

  get 'uploader/index'
  get 'uploader/form'
  post 'uploader/upload'
  get 'uploader/download'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

  # get 'lists/index'
  # get 'lists/new', to: 'lists#new'
  # get 'lists/:name', to: 'lists#show', as: 'list_show'
  # get 'lists/edit/:id', to: 'lists#edit', as: 'list_edit'
  # put 'lists/update/:id', to: 'lists#update', as: 'list_update'
  # post 'lists', to: 'lists#create'
  # delete 'lists/delete/:id', to: 'lists#destroy', as: 'list_delete'