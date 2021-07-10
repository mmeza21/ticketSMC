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
       ps=con.prepareStatement("select * from usuario where id_usuario="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container-fluid">
            <h1 class="h1">Modificar Registro</h1>
            <p class="text-justify">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <hr>
            <h4 class="text-center">Informacion de Usuario</h4>
            <form action="" method="post">
                <label for="exampleInputEmail1">Nombres:</label>
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("nombre")%>"/>
                <div class="form-row">
                <div class="col">  
                <label for="exampleInputEmail1">Apellido Paterno:</label>
                <input type="text" name="txtApeP" class="form-control" value="<%= rs.getString("apellido_P")%>"/>
                </div>
                <div class="col">
                <label for="exampleInputEmail1">Apellido Materno:</label>
                <input type="text" name="txtApeM" class="form-control" value="<%= rs.getString("apellido_M")%>"/>
                </div>
                </div>
                <div class="form-row">
                <div class="col">    
                <label for="exampleInputEmail1">Usuario:</label>
                <input type="text" name="txtUsu" class="form-control" value="<%= rs.getString("nom_usuario")%>"/>
                </div> 
                <div class="col">
                <label for="exampleInputEmail1">Contraseña:</label>
                <input type="password" name="txtContra" class="form-control" value="<%= rs.getString("contraseña")%>"/>
                </div>
                </div>
                <div class="form-group">
                <label for="exampleInputEmail1">Perfil:</label>
                                        <select name="cmbPerfil" class="selectpicker form-control">
                                            <option value="<%= rs.getString("id_perfil")%>"><%= rs.getString("id_perfil")%></option>
                        <%
               coneBD cn=new coneBD();
                try{
                cn.Conectar();
                String sql="select * from perfil;";
                cn.st=cn.conec.createStatement();
                cn.rt=cn.st.executeQuery(sql);
                while (cn.rt.next()){
                    
                    out.println("<option value="+cn.rt.getInt(1)+">"+cn.rt.getString(2)+"</option>");
                    
                }
                }catch(Exception e){
                    out.print(e.toString());
                }
                
%></select>
               
                </div>
                <div class="form-group">
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg btn-block"/>
                <a class="btn btn-secondary btn-lg btn-block" href="ListadoUsuario.jsp" role="button">Volver</a>
                </div>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
 String nom,apeP,apeM,nomUsu,contras,perf;
                
                nom = request.getParameter("txtNom");
                apeP = request.getParameter("txtApeP");
                apeM = request.getParameter("txtApeM");
                nomUsu = request.getParameter("txtUsu");
                contras = request.getParameter("txtContra");
                perf = request.getParameter("cmbPerfil");
       if (nom != null && apeP != null && apeM != null && nomUsu != null && contras != null && perf != null) {
           ps=con.prepareStatement("update usuario set nombre='"+nom+"', apellido_P='"+apeP+"', apellido_M='"+apeM+"', nom_usuario='"+nomUsu+"', contraseña='"+contras+"', id_perfil='"+perf+"'where id_usuario="+id);
           ps.executeUpdate();
           response.sendRedirect("ListadoUsuario.jsp");
       }
       
       
%>
