<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("delete from tickets where id_ticket="+id);
       ps.executeUpdate();
       response.sendRedirect("ListadoTicketDocumentos.jsp");
       %>
