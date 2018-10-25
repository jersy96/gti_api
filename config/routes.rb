Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes
  put 'become_a_tutor', to: 'become_a_tutor#update'

  # Resources
  resources :sessions, only: [:create, :destroy]
  resources :students, only: [:create, :update]
  resources :tutors, only: [:create, :update]
  resources :subjects, only: [:index, :create]
end
