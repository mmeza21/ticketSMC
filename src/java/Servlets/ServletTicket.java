/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuel
 */
@WebServlet(name = "ServletTicket", urlPatterns = {"/ServletTicket"})
public class ServletTicket extends HttpServlet {

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
        String nombre_ticket = request.getParameter("txtNom");
        String asunto = request.getParameter("txtAsunto");
        String prioridad = request.getParameter("txtPrio");
        String fecha_creacion = request.getParameter("txtFechaI");
        String tipo = request.getParameter("txtTipo");
        String rte = request.getParameter("txtRte");
        modelo.Ticket ticket = new modelo.Ticket();
        ticket.setIdTicket(0);
        ticket.setNombreTicket(nombre_ticket);
        ticket.setAsunto(asunto);
        ticket.setPrioridad(prioridad);
        ticket.setFechaCreacion(fecha_creacion);
        ticket.setTipo(tipo);
        ticket.setRte(rte);
        EntityManager em;
        EntityManagerFactory emf;
        emf = Persistence.createEntityManagerFactory("ProTicketUPN4.0PU");
        em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(ticket);
        em.flush();
        em.getTransaction().commit();
        response.sendRedirect("MensajeTicket.jsp");
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
