Rails.application.routes.draw do
  devise_for :users, skip: :registrations, controllers: { 
    sessions: 'users/sessions'
  }

  devise_for :admins, skip: :registrations, controllers: { 
    sessions: 'admins/sessions'
  }
  
  root "home#index"

  get "/formulario", to: 'apply#index'
  get "/historial", to: 'apply#application_history'
  get "/historial/:id", to: 'apply#show'

  get "/dashboard", to: 'admin_panel#index'

  get "/convocatorias", to: 'announcement#index'
  get "/convocatorias/:id", to: 'announcement#show'
  post "/convocatorias/crear", to: 'announcement#create'
  put "/convocatorias/:id/actualizar", to: 'announcement#update'


  
  get "/programas", to: 'program#index'
  post "/programas/crear", to: 'program#create'
  put "/programas/:id/actualizar", to: 'program#update'
  
  get "/universidades", to: 'college#index'
  post "/universidades/crear", to: 'college#create'
  put "/universidades/:id/actualizar", to: 'college#update'
  
  get "/postulaciones", to: 'applicant#index'
  get "/postulaciones/:id", to: 'applicant#show'
  put "/postulaciones/:id/actualizar", to: 'applicant#update'
  
  get "/formularios", to: 'form_panel#index'
  post "/formularios/crear", to: 'form_panel#create'
  put "/formularios/:id/actualizar", to: 'form_panel#update'

end
