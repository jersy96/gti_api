Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes
  put 'become_a_tutor', to: 'become_a_tutor#update'
  post 'tutors/index', to: 'tutors#index'

  # Resources
  resources :sessions, only: [:create, :destroy]
  resources :students, only: [:create, :update]
  resources :tutors, only: [:show, :create, :update]
  resources :subjects, only: [:index, :create]

  # Namespaces
  namespace :tutors do
    scope ':tutor_id' do
      delete :subjects, to: 'subjects#destroy'
      resources :subjects, only: [:create]
    end
  end
end
