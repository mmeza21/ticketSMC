<%@page import="ComboClases.coneBD"%>
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
        <title>Listado de Tickets Documentacion</title>
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
            rs = smt.executeQuery("select * from tickets where tipo='documentacion'");
            //Creamo la Tabla:     
        %>
        
        <div class="container-fluid">
            <h1 class="text-center">TICKETS DE TIPO DOCUMENTACIÓN PROTICKET CONSULTING</h1>
            
            <p class="text-justify"></p>
            <hr>
            <div  class="container-fluid">
            <label>Buscar:</label>
            <input type="text" class="form-control"  id="searchTerm" onkeyup="doSearch()" placeholder="Ingrese parametros de Busqueda..." /><br>
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->
            </div>
             <table class="table table-hover"  id="datos">
                    <thead class="thead-dark">
                        <tr>
                            <th colspan="11">Listado de Tickets Registrados en Sistema</th>
                        </tr>
                    </thead>    
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">#Proyecto</th>
                            <th scope="col">Nombre Ticket</th>
                            <th scope="col">Asunto</th>
                            <th scope="col">Prioridad</th>
                            <th scope="col">Fecha Creacion</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Rmte</th>
                            <th scope="col">Firma</th>
                            <th scope="col">Estado</th>
                            <th class="text-center">Opciones</th>
                        </tr>
                   
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("id_ticket")%></td>
                            <td><%= rs.getInt("id_proyecto")%></td>
                            <td><%= rs.getString("nombre_ticket")%></td>
                            <td><%= rs.getString("asunto")%></td>
                            <td class="table-danger"><%= rs.getString("prioridad")%></td>
                            <td><%= rs.getString("fecha_creacion")%></td>
                            <td><%= rs.getString("tipo")%></td>
                            <td><%= rs.getString("rte")%></td>
                            <td><%= rs.getString("firma")%></td>
                            <td><%= rs.getString("Estado")%></td>
                            
                            
                            
                            
                            
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="EditarTicketDocumentos.jsp?id=<%= rs.getInt("id_ticket")%>"><img src="icon/Edit.png" height="30px" width="30px"></a>
                                <a href="DeleteTicketDocumentos.jsp?id=<%= rs.getInt("id_ticket")%>"><img src="icon/Delete.png" height="30px" width="30px" onclick="return confirm('¿Estas seguro?');"></a>
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>        
      
   
        <script src="js/BuscadorTabla1.js"></script>
        
    </body>
</html>
