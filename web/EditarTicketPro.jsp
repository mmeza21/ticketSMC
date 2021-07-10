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
        
        <title>Actualizar Ticket</title>
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
       ps=con.prepareStatement("select * from tickets where id_ticket="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container-fluid">
            <h1 class="h1">Actualizar Ticket Programacion</h1>
            <p class="text-justify">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
            <hr>
             <h4>Panel Ticket</h4><br>
                <form action="" method="post">
                    <div class="form-row">
                        <div class="col">
                        <label># Proyecto:</label>
                        <input type="text" name="txtPro" class="form-control" value="<%= rs.getString("id_proyecto")%>" readonly/>
                        </div>
                        
                        <div class="col">
                        <label>Nombre de Ticket:</label>
                        <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("nombre_ticket")%>" readonly/>
                        </div>
                    </div>    
                
                <label>Asunto:</label>
                <input type="text" name="txtAsu" class="form-control" value="<%= rs.getString("asunto")%>" readonly/>
                
                    <div class="form-row">
                        <div class="col">
                        <label>Prioridad:</label>
                        <select name="txtPrio" class="form-control"> 
                        <option value="<%= rs.getString("estado")%>" selected/><%= rs.getString("prioridad")%></option>
                        <option value="Media">Media</option>
                        <option value="Alta">Alta</option>
                        </select> 
                        </div>
                        <div class="col">
                        <label>Fecha Creacion:</label>
                        <input type="text" name="txtFechaI" class="form-control" value="<%= rs.getString("fecha_creacion")%>" readonly/>         
                        </div>
                    </div>
                        
                    <div class="form-row">    
                        <div class="col">
                        <label for="exampleInputEmail1">Tipo:</label>
                        <input type="text" name="txtTipo" class="form-control" value="<%= rs.getString("tipo")%>"/>
                        </div>
                    
                        <div class="col">
                        <label>Remitente:</label>
                        <input type="text" name="txtRte" class="form-control" value="<%= rs.getString("rte")%>" readonly/>
                        <input type="hidden" name="txtFirma" class="form-control" value="

                  <%
                HttpSession sesion = request.getSession();
                String usuario;
                String nivel;

                if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
                    usuario = sesion.getAttribute("user").toString();
                    nivel  = sesion.getAttribute("nivel").toString();
                    out.print(""+usuario+"");
                }
                %>

                               "/>
                        </div>
                    </div>    
                <label>Seleccione estado de Ticket:</label>
                <select name="txtEstado" class="form-control"> 
                <option value="<%= rs.getString("estado")%>" selected/><%= rs.getString("estado")%></option>
                <option value="Cancelar">En Cola</option>
                <option value="Solucionado">Solucionado</option>
                <option value="Cancelar">Cancelar</option>
                </select>   
                
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg btn-block"/>
                <a class="btn btn-secondary btn-lg btn-block" href="ListadoTicketPro.jsp" role="button">Volver</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
 String nom,pro,asu,prio,fechai,tipo,rte,fir,est;
                pro = request.getParameter("txtPro");
                nom = request.getParameter("txtNom");
                asu = request.getParameter("txtAsu");
                prio = request.getParameter("txtPrio");
                fechai = request.getParameter("txtFechaI");
                tipo = request.getParameter("txtTipo");
                rte = request.getParameter("txtRte");
                fir = request.getParameter("txtFirma");
                est = request.getParameter("txtEstado");
       if (nom != null && asu != null && prio != null && fechai != null && tipo != null && rte != null && fir != null && est != null) {
           ps=con.prepareStatement("update tickets set nombre_ticket='"+nom+"', asunto='"+asu+"', prioridad='"+prio+"', fecha_creacion='"+fechai+"', tipo='"+tipo+"', rte='"+rte+"' , firma='"+fir+"', estado='"+est+"' where id_ticket="+id);
           ps.executeUpdate();
           response.sendRedirect("ListadoTicketPro.jsp");
       }
       
       
%>
