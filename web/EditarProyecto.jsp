<%@page import="java.sql.*"%>
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
        
        <title>JSP Page</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/reporte";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from proyecto where id_proyecto="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container-fluid">
            <h1 class="h1">Modificar Proyecto</h1>
            <hr>
            <form action="" method="post">
                <label for="exampleInputEmail1">Nombre:</label>
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("nombre_proyecto")%>"/><br>
                
                
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a class="btn btn-secondary btn-lg" href="ListadoProyecto.jsp" role="button">Volver</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
 String nom;
                
                nom = request.getParameter("txtNom");
             
       if (nom != null) {
           ps=con.prepareStatement("update proyecto set nombre_proyecto='"+nom+"' where id_proyecto="+id);
           ps.executeUpdate();
           response.sendRedirect("ListadoProyecto.jsp");
       }
       
       
%>
