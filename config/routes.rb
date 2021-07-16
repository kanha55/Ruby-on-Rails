Rails.application.routes.draw do
  
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  resources :posts, only: [:index, :create, :show, :destroy, :update]
  resources :comments, only: [:index, :create, :show, :destroy, :update]
           
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
