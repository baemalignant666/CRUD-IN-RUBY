class TestCookiesController < ApplicationController
  def identificacion
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
  #Preguntamos si hay un envío de formulario ya sea para crear o eliminar la cookie.
   if request.post?
      if params[:nombre].present?
         #Se está intentando crear la cookie.
         cookies[:nombre] = {
            :value => params[:nombre],#Valor de la cookie.
            :expires => 1.year.from_now,#Tiempo antes de expirar (En este caso 1 año)
            :domain => :all#En qué partes de nuestra página estará disponible (En este caso en todo el sitio)
         }
      else
         #Se está intentando eliminar la cookie.
         cookies.delete(:nombre, :domain => :all);
      end;
      #Redirecciona al controlador.
      redirect_to :controller => "test_cookies", :action => "identificacion";
   end
   #Si existe la cookie con el nombre del visitante la guardamos en la variable @nombre.
   if defined?(cookies[:nombre])
      @nombre = cookies[:nombre];
   else
      @nombre = false;
   end
  end
end
