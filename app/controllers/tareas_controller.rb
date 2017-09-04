class TareasController < ApplicationController
  def index
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    @tarea=Tarea.select("id,titulo,descripcion").where(:activo=>true).order("id DESC")
  end

  def new
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    @tarea=Tarea.new();
  end

  def create
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    #Recuperamos las varibles POST que vinieron desde la acción new.
   @titulo = params[:tarea][:titulo];
   @descripcion = params[:tarea][:descripcion];
   @prioridad = params[:tarea][:prioridad];
   #Creamos el objeto con los valores a ingresar.
   @tarea = Tarea.new({
      :titulo => @titulo,
      :descripcion => @descripcion,
      :prioridad => @prioridad,
      :activo => true
   });
   # @tarea.save();
   #Verificamos si la tarea ha podido ser guardado correctamente.
   if @tarea.save()
      redirect_to tareas_path, :notice => "La tarea ha sido insertada";
   else
      render "new";
   end

  end

  def show
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    @tarea = Tarea.find(params[:id]);
  end

  def edit
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    @tarea = Tarea.find(params[:id]);
   @titulo = @tarea.titulo;
   @descripcion = @tarea.descripcion;
   @prioridad = @tarea.prioridad;

  end

  def update
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    @titulo = params[:tarea]["titulo"];
   @descripcion = params[:tarea]["descripcion"];
   @prioridad = params[:tarea]["prioridad"];
   @tarea = Tarea.find(params[:id]);
   @tarea.titulo = @titulo;
   @tarea.descripcion = @descripcion;
   @tarea.prioridad = @prioridad;
   if @tarea.save()
      redirect_to tareas_path, :notice => "La tarea ha sido modificada";
   else
      render "edit";
   end
  end

  def delete
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
   @tarea = Tarea.find(params[:id]);
   if @tarea.destroy()
      redirect_to tareas_path, :notice => "La tarea ha sido eliminada";
   else
      redirect_to tareas_path, :notice => "La tarea NO ha podido ser eliminada";
   end
end


  def finalizar
    @sesion = get_login();
    if @sesion
       @nombre = @sesion[:nombre];
       @apellido = @sesion[:apellido];
    else
       redirect_to :controller => "test_sesiones", :action => "iniciar_sesion";
    end
    @tarea = Tarea.find(params[:id]);
   @tarea.activo = false;
   if @tarea.save()
      redirect_to tareas_path, :notice => "La tarea ha sido finalizada";
   else
      redirect_to tareas_path, :notice => "La tarea NO ha podido finalizar";
   end
  end
end
