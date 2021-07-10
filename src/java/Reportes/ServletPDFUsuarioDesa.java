/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Reportes;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuel
 */
@WebServlet(name = "ServletPDFUsuarioDesa", urlPatterns = {"/ServletPDFUsuarioDesa"})
public class ServletPDFUsuarioDesa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();

        try {
            
            try {
                Connection c = null;
                Statement st = null;
                ResultSet rs = null;
                String url = "jdbc:mysql://localhost:3306/reporte";
                String usr = "root";
                String pwd = "";
                String sql="select * from usuario where id_perfil='3'";
                
                DriverManager.registerDriver(new Driver());
                c = DriverManager.getConnection(url, usr, pwd);
                st = (Statement)c.createStatement();
                rs = st.executeQuery(sql);
                
                if(c!=null){
                    try {
                Document documento = new Document();
                PdfWriter.getInstance(documento, out);
                
                documento.open();
                
                Paragraph par1 = new Paragraph();
                Font fonttitulo = new Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLACK); 
                par1.add(new Phrase("Reporte de Usuarios",fonttitulo));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);
                
                Image imagenes = Image.getInstance("C:\\Users\\Jhony\\Desktop\\Final\\ProyectoFinal\\ProTicketUPN4.0\\web\\imagenes\\usuarios.png");
                imagenes.setAlignment(Element.ALIGN_CENTER);
                imagenes.scaleToFit(721,271);
                documento.add(imagenes);
                
                Paragraph par2 = new Paragraph();
                Font fontdesc = new Font(Font.FontFamily.HELVETICA,10,Font.NORMAL,BaseColor.BLACK); 
                par2.add(new Phrase("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",fontdesc));
                par2.setAlignment(Element.ALIGN_JUSTIFIED);
                par2.add(new Phrase(Chunk.NEWLINE));
                par2.add(new Phrase(Chunk.NEWLINE));
                documento.add(par2);
                
                Paragraph par3 = new Paragraph();
                par3.add(new Phrase("Listado de Usuarios",fonttitulo));
                par3.setAlignment(Element.ALIGN_LEFT);
                par3.add(new Phrase(Chunk.NEWLINE));
                par3.add(new Phrase(Chunk.NEWLINE));
                documento.add(par3);
                
                PdfPTable tabla = new PdfPTable(7);
                PdfPCell celda1 = new PdfPCell(new Paragraph("#",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Nombres",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Ape. Pt",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Ape. Mt.",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda5 = new PdfPCell(new Paragraph("Usuario",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda6 = new PdfPCell(new Paragraph("Clave",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                PdfPCell celda7 = new PdfPCell(new Paragraph("Perfil",FontFactory.getFont("Tahoma", 11, Font.BOLD, BaseColor.BLACK)));
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                tabla.addCell(celda5);
                tabla.addCell(celda6);
                tabla.addCell(celda7);
                
                while(rs.next()){
                    tabla.addCell(rs.getString(1));
                    tabla.addCell(rs.getString(2));
                    tabla.addCell(rs.getString(3));
                    tabla.addCell(rs.getString(4));
                    tabla.addCell(rs.getString(5));
                    tabla.addCell(rs.getString(6));
                    tabla.addCell(rs.getString(7));
                }
                
                documento.add(tabla);
                
                documento.close();
            } catch (Exception e) {
                e.getMessage();
            }
                }
                
            } catch (Exception e) {e.getMessage();
            }
            
//            try {
//                Document documento = new Document();
//                PdfWriter.getInstance(documento, out);
//                
//                documento.open();
//                
//                Paragraph par1 = new Paragraph();
//                Font fonttitulo = new Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLUE); 
//                par1.add(new Phrase("Reporte de Tickets",fonttitulo));
//                par1.setAlignment(Element.ALIGN_CENTER);
//                par1.add(new Phrase(Chunk.NEWLINE));
//                par1.add(new Phrase(Chunk.NEWLINE));
//                documento.add(par1);
//                
//                Paragraph par2 = new Paragraph();
//                Font fontdesc = new Font(Font.FontFamily.TIMES_ROMAN,12,Font.NORMAL,BaseColor.BLACK); 
//                par2.add(new Phrase("Para hacer este reporte en formato PDF "
//                        + "hacemos uso de la libreria iTextpdf y el uso de servlet para programarlo, "
//                        + "este documento es un PDF de prueba",fontdesc));
//                par2.setAlignment(Element.ALIGN_JUSTIFIED);
//                par2.add(new Phrase(Chunk.NEWLINE));
//                par2.add(new Phrase(Chunk.NEWLINE));
//                documento.add(par2);
//                
//                Image imagenes = Image.getInstance("C:\\Users\\Rai\\Desktop\\Practicar\\html\\reportePDF\\FB_IMG.jpg");
//                imagenes.setAlignment(Element.ALIGN_CENTER);
//                imagenes.scaleToFit(100,100);
//                documento.add(imagenes);
//                
//                documento.add(new Phrase(Chunk.NEWLINE));
//                documento.add(new Phrase(Chunk.NEWLINE));
//                
//                PdfPTable tabla = new PdfPTable(3);
//                PdfPCell celda1 = new PdfPCell(new Paragraph("Codigo",FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
//                PdfPCell celda2 = new PdfPCell(new Paragraph("Nombre",FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
//                PdfPCell celda3 = new PdfPCell(new Paragraph("Precio",FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
//                tabla.addCell(celda1);
//                tabla.addCell(celda2);
//                tabla.addCell(celda3);
//                
//                tabla.addCell("1");
//                tabla.addCell("Shampoo");
//                tabla.addCell("10");
//                tabla.addCell("2");
//                tabla.addCell("Leche");
//                tabla.addCell("3");
//                
//                documento.add(tabla);
//                
//                
//                documento.close();
//            } catch (Exception e) {
//                e.getMessage();
//            }
            
        } finally{
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
