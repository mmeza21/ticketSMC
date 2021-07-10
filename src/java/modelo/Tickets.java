/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Manuel
 */
@Entity
@Table(name = "tickets")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tickets.findAll", query = "SELECT t FROM Tickets t")
    , @NamedQuery(name = "Tickets.findByIdTicket", query = "SELECT t FROM Tickets t WHERE t.idTicket = :idTicket")
    , @NamedQuery(name = "Tickets.findByNombreTicket", query = "SELECT t FROM Tickets t WHERE t.nombreTicket = :nombreTicket")
    , @NamedQuery(name = "Tickets.findByAsunto", query = "SELECT t FROM Tickets t WHERE t.asunto = :asunto")
    , @NamedQuery(name = "Tickets.findByPrioridad", query = "SELECT t FROM Tickets t WHERE t.prioridad = :prioridad")
    , @NamedQuery(name = "Tickets.findByFechaCreacion", query = "SELECT t FROM Tickets t WHERE t.fechaCreacion = :fechaCreacion")
    , @NamedQuery(name = "Tickets.findByTipo", query = "SELECT t FROM Tickets t WHERE t.tipo = :tipo")
    , @NamedQuery(name = "Tickets.findByRte", query = "SELECT t FROM Tickets t WHERE t.rte = :rte")
    , @NamedQuery(name = "Tickets.findByFirma", query = "SELECT t FROM Tickets t WHERE t.firma = :firma")
    , @NamedQuery(name = "Tickets.findByEstado", query = "SELECT t FROM Tickets t WHERE t.estado = :estado")})
public class Tickets implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_ticket")
    private Integer idTicket;
    @Column(name = "nombre_ticket")
    private String nombreTicket;
    @Column(name = "asunto")
    private String asunto;
    @Column(name = "prioridad")
    private String prioridad;
    @Column(name = "fecha_creacion")
    private String fechaCreacion;
    @Column(name = "tipo")
    private String tipo;
    @Column(name = "rte")
    private String rte;
    @Column(name = "firma")
    private String firma;
    @Column(name = "estado")
    private String estado;
    @JoinColumn(name = "id_proyecto", referencedColumnName = "id_proyecto")
    @ManyToOne
    private Proyecto idProyecto;

    public Tickets() {
    }

    public Tickets(Integer idTicket) {
        this.idTicket = idTicket;
    }

    public Integer getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(Integer idTicket) {
        this.idTicket = idTicket;
    }

    public String getNombreTicket() {
        return nombreTicket;
    }

    public void setNombreTicket(String nombreTicket) {
        this.nombreTicket = nombreTicket;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRte() {
        return rte;
    }

    public void setRte(String rte) {
        this.rte = rte;
    }

    public String getFirma() {
        return firma;
    }

    public void setFirma(String firma) {
        this.firma = firma;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Proyecto getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(Proyecto idProyecto) {
        this.idProyecto = idProyecto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTicket != null ? idTicket.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tickets)) {
            return false;
        }
        Tickets other = (Tickets) object;
        if ((this.idTicket == null && other.idTicket != null) || (this.idTicket != null && !this.idTicket.equals(other.idTicket))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Tickets[ idTicket=" + idTicket + " ]";
    }

    public void setIdProyecto(int id_proyecto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    
}
