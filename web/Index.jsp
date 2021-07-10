<%@page import="ModeladoLogin.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilos.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

        <title>Index</title>
         
    </head>
    <body>
     
        <div class="sidenav" style="background: #252528;">
         <div class="login-main-text">
             <h2>Soporte SMC</h2><h4>Area Reservada</h4>
             <small class="text-muted">Seleccione su perfil e ingrese su usuario y contraseña proporcinado por el Administrador, acontinuacion inicie sesion para tener acceso al sistema.</small>
            <center><img src="imagenes/logo.png" ></center>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form" >
                <form action=""><br>
                    <div class="form-group">
                     <h2>BIENVENIDO:</h2>
                     <select name="combo" class="form-control">
                         <option selected>Seleccione Perfil</option>
                         <option value="1">Administrador</option>
                         <option value="2">Soporte</option>
                         <option value="3">Empleados</option>
                         <option value="4">Cliente</option>
                     </select>
                     
                  </div>
                  <div class="form-group">
                     
                     <input type="text" class="form-control" placeholder="Nombre de Usuario" name="txtUsuario" required>
                  </div>
                  <div class="form-group">
                     
                     <input type="password" class="form-control" placeholder="Clave" name="txtContra" required>
                  </div>
                  <button type="submit" class="btn btn-dark btn-block" name="btnIngresar">Iniciar</button>
                  <button type="reset" class="btn btn-secondary btn-block">Limpiar</button>
                    
        <%-- Logeo JSP por Nivel de Usuario --%>
                        <%
              Operaciones op=new Operaciones();
              if(request.getParameter("btnIngresar")!=null){
                String nombre=request.getParameter("txtUsuario");
                String contra=request.getParameter("txtContra");
                String combo=request.getParameter("combo");
                
                HttpSession sesion = request.getSession();
                switch(op.loguear(nombre, contra, combo)){
                    case 1:
                        session.setAttribute("user", nombre);
                        session.setAttribute("nivel", "Administrador");
                        response.sendRedirect("MenuAdmin.jsp");
                        break;
                    
                    case 2:
                        session.setAttribute("user", nombre);
                        session.setAttribute("nivel", "Analista");
                        response.sendRedirect("MenuAnalista.jsp");
                        break; 
                    
                    case 3:
                        session.setAttribute("user", nombre);
                        session.setAttribute("nivel", "Programador");
                        response.sendRedirect("MenuProgramador.jsp");
                        break;  
                    
                    case 4:
                        session.setAttribute("user", nombre);
                        session.setAttribute("nivel", "Cliente");
                        response.sendRedirect("MenuCliente.jsp");
                        break;  
                    
                    case 5:
                        session.setAttribute("user", nombre);
                        session.setAttribute("nivel", 5);
                        response.sendRedirect("PanelDefault.jsp");
                        break;
                         
                        default:
                       
                        %>
                        <br><br>
                        <div class="alert alert-danger" role="alert"><strong>Upss...! </strong><label><%out.write("usuario no existe o contraseña invalida");%></label></div>
                        <%break;
                }
            }
              if(request.getParameter("cerrar")!=null){
                session.invalidate();
                  
              }
            %> 
      
               </form>
                
            </div>
             
         </div>
      </div>
    </body>
</html>
