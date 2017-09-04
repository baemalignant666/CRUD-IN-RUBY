Rails.application.routes.draw do
  get 'tareas/index'

  get 'tareas/new'

  get 'tareas/create'

  get 'tareas/show'

  get 'tareas/edit'

  get 'tareas/update'

  get 'tareas/destroy'

  get 'test_sesiones/iniciar_sesion'
  post "test_sesiones/iniciar_sesion"

  get 'test_sesiones/cerrar_sesion'

  get 'test_sesiones/bienvenida'

  get 'test_cookies/identificacion'
  post "test_cookies/identificacion"

  get 'archivos/subir_archivos'
  post 'archivos/subir_archivos'

  get 'archivos/listar_archivos'

  get 'archivos/borrar_archivos'
  post 'archivos/borrar_archivos'

  get 'archivos/guardar_comentarios'
  post 'archivos/guardar_comentarios'

  get 'formularios/por_get'

  get 'formularios/por_post'
  post 'formularios/por_post'

  get 'redes_sociales/facebook'

  get 'redes_sociales/twitter'

  get 'redes_sociales/google_mas'

  get 'images/google_mas_logo'

  get 'principal/index'
  get 'principal/indextres'

  root :to => 'principal#indextres'
  resources:tareas
  root :to => 'tareas#index'
  put "tareas/finalizar"


  match 'tareas/finalizar/:id' => 'tareas#finalizar', via:[:get,:post]
  match 'tareas/delete/:id' => 'tareas#delete',via:[:get,:post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
