Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }
  
  # ログイン画面をホームにする
  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  get    'users/index'
  get    'users/new'
  get    'users/show',           to: 'users#show'
  post   'users/show'
  get    'user/item',            to: 'users#user_item'
  post   'users',                to: 'users#create'
  get    'users/:id/edit',       to: 'users#edit',    as: 'user_edit'
  put    'users/:id',            to: 'users#update',  as: 'user_update'
  delete 'users/:id',            to: 'users#destroy', as: 'user_delete'
  get    'users/acknowledgment', to: 'users#acknowledgment'
  post   'users/acknowledgment'
  get    'users/get_image'

  get    'owners/index'
  get    'owners/monitoring'
  get    'owners/list_new'
  get    'owners/new'
  post   'owners',                to: 'owners#create'
  get    'owners/show'
  post   'owners/show'
  get    'owners/create'
  get    'owners/edit'
  patch  'owners/:id',            to: 'owners#update',  as: 'owners/update'
  get    'owners/destroy'
  get    'owners/login'
  get    'owners/acknowledgment', to: 'owners#acknowledgment'
  post   'owners/acknowledgment'
  get    'owners/get_source'


  get    'lists',          to: 'lists#index'
  get    'lists/new',      to: 'lists#new'
  get    'lists/show',     to: 'lists#show'
  post   'lists',          to: 'lists#create'
  get    'lists/:id/edit', to: 'lists#edit',    as: 'list_edit'
  put    'lists/:id',      to: 'lists#update',  as: 'list_update'
  delete 'lists/:id',      to: 'lists#destroy', as: 'list_delete'

  get    'items/index'
  get    'items/new'
  get    'items/show'
  post   'items',          to: 'items#create'
  get    'items/:id/edit', to: 'items#edit',    as: 'item_edit'
  patch  'items/:id',      to: 'items#update',  as: 'item_update'
  delete 'items/:id',      to: 'items#destroy', as: 'item_delete'
  put    'items/delete_file_all'
  put    'items/delete_file'

  get    'uploader/index'
  get    'uploader/form'
  post   'uploader/upload'
  get    'uploader/download'

  get    'source/index'
  get    'source/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end