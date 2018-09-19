Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users , only: [:create,:new ]
  resource :session, only: [:create,:destroy, :new]

  resources :subs, except: [:destroy]
  resources :posts, except: [:destroy, :index] do
    resources :comments, only:[:new]
  end

root to: redirect('/subs')

end
