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
        <title>Listado Usuarios</title>
    </head>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/reporte";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from proyecto");
            //Creamo la Tabla:     
        %>
        
        <div class="container-fluid">
            <h1 class="text-center">PROYECTOS SOPORTE SMC</h1>
        
            <p class="text-justify"></p>
            <hr>            
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Registrar Proyecto</button>
          
        </div>  
        <br>    
        
        <div class="container-fluid">
            <input type="text" class="form-control"  id="searchTerm" onkeyup="doSearch()" placeholder="Busqueda por Nombre..." /><br>
           
                   <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
             <table class="table table-hover"  id="datos">
                 <thead class="thead-dark">
                        <tr>
                            <th colspan="3">Lista de Proyectos Registrados en Sistema</th>
                        </tr>
                        </thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre de Proyecto</th>
                            <th class="text-center">Opciones</th>
                        </tr>
                    
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("id_proyecto")%></td>
                            <td><%= rs.getString("nombre_proyecto")%></td>
                           
                            
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="EditarProyecto.jsp?id=<%= rs.getInt("id_proyecto")%>"><button type="button" class="btn btn-success">Editar Proyecto</button></a>
                                <a href="DeleteProyecto.jsp?id=<%= rs.getInt("id_proyecto")%>"><button type="button" class="btn btn-danger" onclick="return confirm('¿Estas seguro de Eliminar Proyecto?');">Borrar Proyecto</button></a>
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Registro de Proyecto</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                
                                <input type="text" name="txtNom" class="form-control" placeholder="Escriba Nombre de Proyecto..." required/><br>
                             
                            <br>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>                            
                                    <input type="submit" value="Crear" class="btn btn-info"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
                String nom;
                
                nom = request.getParameter("txtNom");
                
                
                
                if (nom != null) {
                    ps = con.prepareStatement("insert into proyecto(nombre_proyecto)values('" + nom + "')");
                    ps.executeUpdate();
                    response.sendRedirect("ListadoProyecto.jsp");

                }
            %>
        </div> 
   
        <script src="js/BuscadorTabla.js"></script>
        
    </body>
</html>
