<%@page import="ComboClases.coneBD" %>
<%@page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
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
        <div class="container">
                <form action="">
                    <h1>Registro Ticket</h1>
                    <p class="text-justify">Espacio para generacion de ticket, acontinuacion llene el siguiente formulario para poder ser atendido por el personal a cargo por su determinado tipo (Desarrollador y Analista).</p>
                 <hr>
                <input type="hidden"  name="txtCod">
                <div class="form-group">
                <label>Seleccione Proyecto:</label>
                <select name="txtPro" class="form-control"> 
                            <%
                                coneBD cn = new coneBD();
                                try {
                                    cn.Conectar();
                                    String sql = "select * from proyecto;";
                                    cn.st = cn.conec.createStatement();
                                    cn.rt = cn.st.executeQuery(sql);
                                    while (cn.rt.next()) {

                                        out.println("<option value=" + cn.rt.getInt(1) + ">" + cn.rt.getString(2) + "</option>");
                                    }
                                } catch (Exception e) {
                                    out.print(e.toString());
                                }

                            %>
                </select>
                </div> 
                <div class="form-group">
                <label>Nombre de Ticket:</label>
                <input type="text" name="txtNom" class="form-control">
                </div>
                <div class="form-group">
                <label> Asunto:</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="txtAsunto" required></textarea>
                </div>
               
                <input type="hidden" name="txtPrio" value="Baja"> 
               
                <div class="form-group">
                    <label>Fecha:</label><input type="date"  name="txtFecha" class="form-control">
                </div>
                <div class="form-group">
                <label>Tipo:</label>
                <select name="txtTipo" class="form-control">
                        <option selected>Seleccione Tipo</option>
                        <option value="Programacion">Programacion</option>
                        <option value="Documentacion">Documentacion</option>
                </select>
                </div>
               <input type="hidden"  name="txtRmte" 
                    value="<%
                   HttpSession sesion = request.getSession();
                   String usuario;
                   usuario = sesion.getAttribute("user").toString();
                   out.print(""+usuario+"");
                    %>">
                <input type="hidden"  name="txtFirma" value="">
                <input type="hidden"  name="txtEstado" value="Pendiente">
                <input type="submit" name="btnGrabar" value="Enviar" class="btn btn-primary">
                <input class="btn btn-secondary" type="reset" value="Limpiar">
                </form>
        </div>
    </body>
</html>
<%
            Connection con;
            String url="jdbc:mysql://localhost:3306/reporte";
            String Driver="com.mysql.jdbc.Driver";
            String user="root";
            String clave="";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
           String pro,nom,asu,prio,fecha,tipo,rmte,firma,estado;
                    
                pro = request.getParameter("txtPro");
                nom = request.getParameter("txtNom");
                asu = request.getParameter("txtAsunto");
                prio = (request.getParameter("txtPrio"));
                fecha = (request.getParameter("txtFecha"));
                tipo = (request.getParameter("txtTipo"));
                rmte = (request.getParameter("txtRmte"));
                firma = (request.getParameter("txtFirma"));
                estado = (request.getParameter("txtEstado"));

           if(pro!=null && nom!=null && asu!=null&& prio!=null&& fecha!=null&& tipo!=null&& rmte!=null && firma!=null&& estado!=null){
               ps=con.prepareStatement("insert into tickets (id_proyecto,nombre_ticket,asunto,prioridad,fecha_creacion,tipo,rte,firma,estado) values('" + pro + "','" + nom + "','" + asu + "','" + prio + "','" + fecha + "','" + tipo + "','" + rmte + "','" + firma + "','" + estado + "')");
               ps.executeUpdate();
               response.sendRedirect("MensajeTicket.jsp");
           }
            %>
