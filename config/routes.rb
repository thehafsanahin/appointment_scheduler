Rails.application.routes.draw do

  resources :prescriptions

  resources :medicine_formularies

  resources :interactions

  resources :side_effects

  resources :precautions

  resources :known_problems

  resources :problems

  resources :appointments do
    member do
      post 'update_status'
    end
  end

  resources :time_slots, except: [:edit, :show]

  get 'search/index'

  resources :search, only: :index do
    collection do
      get 'autocomplete'
    end
  end

  get 'users/dashboard', to: 'users#dashboard', as: 'users_dashboard'


  devise_for :users
  resources :users, :only => [:edit, :show]

  devise_for :patients, :controllers => {
      registrations: 'patients/registrations'
  }, skip: :sessions
  devise_for :doctors, :controllers => {
      registrations: 'doctors/registrations'
  }

  get 'patients/dashboard', to: 'patients#dashboard', as: 'patients_dashboard'
  get 'patients/records', to: 'patients#records', as: 'patients_records'
  get 'patients/public_profile', to: 'patients#public_profile', as: 'patients_public_profile'
  get 'doctors/dashboard', to: 'doctors#dashboard', as: 'doctors_dashboard'
  get 'doctors/appointments', to: 'doctors#appointments', as: 'doctors_appointments'

  root  'search#index'

end
