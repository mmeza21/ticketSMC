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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Manuel
 */
@Entity
@Table(name = "ticket")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ticket.findAll", query = "SELECT t FROM Ticket t")
    , @NamedQuery(name = "Ticket.findByIdTicket", query = "SELECT t FROM Ticket t WHERE t.idTicket = :idTicket")
    , @NamedQuery(name = "Ticket.findByNombreTicket", query = "SELECT t FROM Ticket t WHERE t.nombreTicket = :nombreTicket")
    , @NamedQuery(name = "Ticket.findByAsunto", query = "SELECT t FROM Ticket t WHERE t.asunto = :asunto")
    , @NamedQuery(name = "Ticket.findByPrioridad", query = "SELECT t FROM Ticket t WHERE t.prioridad = :prioridad")
    , @NamedQuery(name = "Ticket.findByFechaCreacion", query = "SELECT t FROM Ticket t WHERE t.fechaCreacion = :fechaCreacion")
    , @NamedQuery(name = "Ticket.findByTipo", query = "SELECT t FROM Ticket t WHERE t.tipo = :tipo")
    , @NamedQuery(name = "Ticket.findByRte", query = "SELECT t FROM Ticket t WHERE t.rte = :rte")})
public class Ticket implements Serializable {

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

    public Ticket() {
    }

    public Ticket(Integer idTicket) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTicket != null ? idTicket.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ticket)) {
            return false;
        }
        Ticket other = (Ticket) object;
        if ((this.idTicket == null && other.idTicket != null) || (this.idTicket != null && !this.idTicket.equals(other.idTicket))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Ticket[ idTicket=" + idTicket + " ]";
    }
    
}
