class FormulariosController < ApplicationController
  def por_get
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
  @codigo = params[:codigo];
   if @codigo
      case @codigo
         when "123"
            @usuario = {:nombre => "Raúl", :apellido => "Hernández"};
         when "456"
            @usuario = {:nombre => "Yenireth", :apellido => "Rodriguez"};
         when "789"
            @usuario = {:nombre => "Pedro", :apellido => "Ramírez"};
         else
            @usuario = false;
         end
   end
  end

  def por_post
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
  @respuesta = false;
   if request.post?
      @comentario = {
         :nombre => params[:nombre],
         :consulta => params[:comentario]
      };
   end
  end
end

#Métodos privados.
private
def login(usuario, contrasena)
  #Verifica que el nombre de usuario y la contraseña sean correctos
  if usuario == "administrador" and contrasena == "1234"
     #Los datos son correctos entonces crea la sesión y devuelve true.
     session[:logueado] = true;
     session[:nombre] = "Roberto";
     session[:apellido] = "Rodríguez";
     return true;
  else
     #Los datos no son correctos entonces devuelve false.
     return false;
  end
end
def logout
  #Desloguea al usuario.
  session[:logueado] = false;
  session[:nombre] = nil;
  session[:apellido] = nil;
redirect_to :controller => "principal", :action => "indextres";
end
def get_login
  #Verifica si el usuario está logueado. Primero pregunta si existe la session[:logueado] y además que este sea true, si existe devuelve la sesión sino existe devuelve false.
  if defined?(session[:logueado]) and session[:logueado]
     #Está logueado.
     return session;
  else
     #No está logueado.
     return false;
  end
end
