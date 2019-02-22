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
  get 'owners/monitoring'
  get 'owners/list_new'
  get 'owners/new'
  post 'owners',         to: 'owners#create'
  get 'owners/show'
  get 'owners/create'
  get 'owners/edit'
  get 'owners/update'
  get 'owners/destroy'
  get 'owners/login'


  get    'lists',          to: 'lists#index'
  get    'lists/new',      to: 'lists#new'
  get    'lists/show',     to: 'lists#show'
  post   'lists',          to: 'lists#create'
  get    'lists/:id/edit', to: 'lists#edit',    as: 'list_edit'
  patch  'lists/:id',      to: 'lists#update',  as: 'list_update'
  delete 'lists/:id',      to: 'lists#destroy', as: 'list_delete'

  get 'items/index'
  get 'items/new'
  get 'items/show'
  post 'items',         to: 'items#create'
  get    'items/:id/edit', to: 'items#edit',    as: 'item_edit'
  patch  'items/:id',      to: 'items#update',  as: 'item_update'
  delete 'items/:id',      to: 'items#destroy', as: 'item_delete'

  get 'uploader/index'
  get 'uploader/form'
  post 'uploader/upload'
  get 'uploader/download'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end