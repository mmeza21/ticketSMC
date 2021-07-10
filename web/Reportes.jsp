<%-- 
    Document   : Reportes
    Created on : 07/07/2019, 06:41:35 PM
    Author     : Manuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- Boostrap-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!--fin-->  
        <link rel="stylesheet" href="css/Reporte.css"/>
        <title>Reportes</title>
    </head>
    <body>
        <div class="container-fluid">
            <BR>
            <h1 class="text-center">REPORTES</h1>
        <p class="text-justify">Los reportes del sistema son actualizados automaticamente, el acceso a esta interfaz solo lo tiene el administrador. Los reportes han sido consultados y desarrollados de acuerdo a las necesidades de la empresa. </p>
        <hr>
        <h4>Listado de Reportes:</h4><br>
        <div class="container">
        <div class="form-group">
        <form action="pdf.jsp" target="main">
            <input type="submit" value="Reporte de Proyectos" class="btn btn-info  btn-block">
        </form>
        </div></div>
        <div class="form-group">
        <form action="pdfu.jsp" target="main">
            <input type="submit" value="Reporte de Usuarios en Sistema" class="btn btn-info btn-block">
        </form>
        </div>
        <div class="form-group">
        <form action="pdfcadmin.jsp" target="main">
            <input type="submit" value="Reporte de Administradores" class="btn btn-info btn-block">
        </form>
        </div>
        <div class="form-group">
        <form action="pdfcanalista.jsp" target="main">
            <input type="submit" value="Reporte de Analistas" class="btn btn-info btn-block">
        </form>
        </div>
        <div class="form-group">
        <form action="pdfdesarrollador.jsp" target="main">
            <input type="submit" value="Reporte de Desarrolladores" class="btn btn-info btn-block">
        </form>
        </div>
        <div class="form-group">
        <form action="pdfc.jsp" target="main">
            <input type="submit" value="Reporte de Clientes" class="btn btn-info btn-block">
        </form>
        </div>
        <div class="form-group">
        <form action="pdf2.jsp" target="main">
            <input type="submit" value="Reporte Tickets" class="btn btn-info btn-block">
        </form>
        </div>     
        </body>
</html>
