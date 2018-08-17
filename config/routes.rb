 Rails.application.routes.draw do
   root 'accounts#index'
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'accounts/:id/calculate', to: 'accounts#calculate', as: :calculate_accounts
end
