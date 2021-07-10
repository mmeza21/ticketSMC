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
            rs = smt.executeQuery("select id_usuario, nombre, apellido_P, apellido_M, nom_usuario, contraseña, usuario.id_usuario, perfil.nombre_perfil as cargo from usuario inner join perfil on perfil.id_perfil = usuario.id_perfil ");
            //Creamo la Tabla:     
        %>
        
        <div class="container-fluid">
<h1 class="text-center">USUARIOS REGISTRADOS EN PROTICKET CONSULTING</h1>
<p class="text-justify">En esta interfaz se visualizan todos los usuarios del sistema con su respectivo cargo. Solo los administradores tienen acceso a la visualizacion y creación de nuevos usuarios, se tiene la facilidad de realizar la busqueda de los usuarios predictivamente. Tambien ante cualquier error de digitacion o cambio de clave tiene la opción de modificar y corregir su usuario teniendo en cuenta que el usuario sea el administrador.</p>
            <hr>             
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Registrar Usuario</button>
          
        </div>  
        <br>    
        
        <div class="container-fluid">
            <label>Buscar:</label>
            <input type="text" class="form-control"  id="searchTerm" onkeyup="doSearch()" placeholder="Ingrese parametros de Busqueda..." /><br>
            
                   <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
             <table class="table table-sm table-hover"  id="datos">
                    <thead class="thead-dark">
                        <tr>
                            <th colspan="8">Lista de Usuarios Registrados en Sistema</th>
                        </tr>
                        </thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">NOMBRE</th>
                            <th scope="col">APELLIDO PATERNO</th>
                            <th scope="col">APELLIDO MATERNO</th>
                            <th scope="col">USUARIO</th>
                            <th scope="col">CLAVE</th>
                            <th scope="col">PERFIL</th>
                            <th class="text-center">OPCIONES</th>
                        </tr>
                    
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("id_usuario")%></td>
                            <td><%= rs.getString("nombre")%></td>
                            <td><%= rs.getString("apellido_P")%></td>
                            <td><%= rs.getString("apellido_M")%></td>
                            <td><%= rs.getString("nom_usuario")%></td>
                            <td><%= rs.getString("contraseña")%></td>
                            <td><%= rs.getString("cargo")%></td>
                            
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="EditarUsuario.jsp?id=<%= rs.getInt("id_usuario")%>"><button type="button" class="btn btn-secondary">Modificar</button></a>
                                <a href="DeleteUsuario.jsp?id=<%= rs.getInt("id_usuario")%>"><button type="button" class="btn btn-danger" onclick="return confirm('¿Estas seguro de Eliminar el Usuario?');">Eliminar</button></a>
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
                            <h4 class="modal-title" id="myModalLabel">Registro de Usuario</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                
                                <input type="text" name="txtNom" class="form-control" placeholder="Nombres..." required/><br>
                             
                                <input type="text" name="txtApeP" class="form-control" placeholder="Apellido Paterno..." required/><br>  
                                
                                <input type="text" name="txtApeM" class="form-control" placeholder="Apellido Materno..." required/><br> 
                                
                                <input type="text" name="txtUsu" class="form-control" placeholder="Usuario..." required/><br> 
                               
                                <input type="password" name="txtContra" class="form-control" placeholder="Contraseña..." required/> <br>
                                <label>Seleccione Perfil:</label>
                                 <select name="cmbPerfil" class="form-control"> 
                            <%
                                coneBD cn = new coneBD();
                                try {
                                    cn.Conectar();
                                    String sql = "select * from perfil;";
                                    cn.st = cn.conec.createStatement();
                                    cn.rt = cn.st.executeQuery(sql);
                                    while (cn.rt.next()) {
                                         out.println("<option value=" + cn.rt.getInt(1) + ">" + cn.rt.getString(2) + "</option>");
                                    }
                                } catch (Exception e) {
                                    out.print(e.toString());
                                }

                            %></select>
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
                String nom,apeP,apeM,nomUsu,contras,perf;
                
                nom = request.getParameter("txtNom");
                apeP = request.getParameter("txtApeP");
                apeM = request.getParameter("txtApeM");
                nomUsu = request.getParameter("txtUsu");
                contras = request.getParameter("txtContra");
                perf = request.getParameter("cmbPerfil");
                
                if (nom != null && apeP != null && apeM != null && nomUsu != null && contras != null && perf != null) {
                    ps = con.prepareStatement("insert into usuario(nombre, apellido_P, apellido_M, nom_usuario, contraseña, id_perfil)values('" + nom + "','" + apeP + "','" + apeM + "','" + nomUsu + "','" + contras + "','" + perf + "')");
                    ps.executeUpdate();
                    response.sendRedirect("ListadoUsuario.jsp");

                }
            %>
        </div> 
   
        <script src="js/BuscadorTabla.js"></script>
        
    </body>
</html>
