Rails.application.routes.draw do
  #get 'courses/index'
  #get 'courses/new'
  #get 'courses/create'
  #get 'courses/destroy'
  #get 'inicio/index'
  root 'inicio#index'
  
  get 'signupt' => 'tutors#new'
  get 'signups' => 'students#new'
  resources :students
  
  resources :programs do
    get :subscribe
  end
  

  #resources :grade_evaluations, only: [:show, :new, :create]
  resources :evaluations do
    resources :grade_evaluations, only: [:show, :new, :create]
  end

  resources :programs do
    resources :courses
  end

  resources :courses do
    resources :evaluations, only: [:show, :new, :create, :destroy, :update, :edit] do
      post :uploadf
    end
  end
  resources :courses do
    resources :practices, only: [:show, :new, :create, :destroy, :update, :edit] do
      post :uploadf
    end
  end
  
  resources :courses do
    resources :materials, only: [:show, :new, :create, :destroy, :update, :edit] do
      post :uploadf
    end
  end
    
    
  #get 'programs/:program_id/courses/new', to: 'courses#new', as: :programs_courses
  #post 'programs/:program_id/courses/', to: 'courses#create'
  #delete 'programs/:program_id/courses/:id', to: 'courses#destroy', as: :programs_courses_d
  #resources :courses
  
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
 
  get 'logout' => 'sessions#destroy'
  

  #resources :courses, only: [:index, :new, :create, :destroy]
   #root "resumes#index"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
