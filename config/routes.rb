Rails.application.routes.draw do
  get 'inicio/index'
  root 'inicio#index'
  
  get 'signupt' => 'tutors#new'
  get 'signups' => 'students#new'
  resources :students
  resources :programs
  
  resources :tutors
  
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/students/:id' => 'students#edit'
  post '/students/:id' => 'students#update'
  #resources :programs do
  #  resources :tutors
  #end
  get 'programs/:program_id/tutors/', to: 'programs_tutor#index', as: :programs_tutor
  post 'programs/:program_id/tutors/', to: 'programs_tutor#create'
  delete 'logout' => 'sessions#destroy'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
