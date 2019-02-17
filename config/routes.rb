Rails.application.routes.draw do

  root to: 'owners#login'

  get 'users/index'
  get 'users/new'
  get 'users/show', to: 'users#show'
  post 'user/item', to: 'users#user_item', as: 'user_item'
  post 'users',         to: 'users#create'
  get 'users/:id/edit', to: 'users#edit',    as: 'user_edit'
  patch  'users/:id',   to: 'users#update',  as: 'user_update'
  delete 'users/:id',   to: 'users#destroy', as: 'user_delete'

  get 'owners/index'
  get 'owners/new'
  get 'owners/show'
  get 'owners/create'
  get 'owners/edit'
  get 'owners/update'
  get 'owners/destroy'
  get 'owners/login'

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