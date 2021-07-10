<%-- 
    Document   : menuv2
    Created on : 26/06/2019, 11:14:52 AM
    Author     : Manuel
--%>
<%@page  session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Menu Administrador</title>
    </head>
     <%
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
            usuario = sesion.getAttribute("user").toString();
            nivel  = sesion.getAttribute("nivel").toString();%>
            
       
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="BienvenidoAdmin.jsp" target="main">Soporte SMC</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
          <a class="nav-link" href="BienvenidoAdmin.jsp" target="main">Inicio <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="ListadoUsuario.jsp" target="main">Usuarios</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="ListadoProyecto.jsp" target="main">Proyectos</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Tickets
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="ListadoTicketDocumentos.jsp" target="main">Hardware</a>
            <a class="dropdown-item" href="ListadoTicketPro.jsp" target="main">Software</a>
        </div>
      </li>
  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Reportes
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="pdfcadmin.jsp" target="main">Administradores</a>
            <a class="dropdown-item" href="pdfcanalista.jsp" target="main">Soporte</a>
            <a class="dropdown-item" href="pdfdesarrollador.jsp" target="main">Empleados</a>
            <a class="dropdown-item" href="pdfc.jsp" target="main">Clientes</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="pdf.jsp" target="main">Proyectos</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="pdfticket.jsp" target="main">Tickets</a>
            
            
        </div>
      </li>
    </ul>
      
  </div>
  <div class="btn-group">
  <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <%out.print("Bienvenido: "+usuario+"");%>
  </button>
  <div class="dropdown-menu dropdown-menu-right">
    <button class="dropdown-item" type="button"><%out.print("Perfil: "+nivel+"");%></button>
    <div class="dropdown-divider"></div>
   <a class="dropdown-item" href="Index.jsp?cerrar=true" style="text-align: center;">Salir</a>
  </div>
</div>
</nav>
<%}else{
            out.print("<script>location.replace('Index.jsp');</script>");
                  }
%>
    <!-- Cuerpo de la pagina ira cambiando cuando clickean en el Menu-->
    <iframe name="main" width="100%" style="height: 100vh; position: fixed;" src="BienvenidoAdmin.jsp" frameborder="0"  scrolling="auto">
    </iframe>
    <!--Fin-->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
