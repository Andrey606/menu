Rails.application.routes.draw do
  namespace :admin do
    get 'sessions/new'
    post 'sessions/create'
    # get 'sessions/destroy'
    resources :pdf_files, only: [:index, :create, :destroy, :new, :open_pdf]

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end  

  get 'open_pdf/:id', to: 'admin/pdf_files#open_pdf', as: 'open_pdf'

  root 'pages#home'
end