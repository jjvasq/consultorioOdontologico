package logica;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @author JV7859
 */
@Entity
public class Turno implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idTurno;
    private Date fechaTurno;
    private String horaTurno;
    private String afeccion;

    @ManyToOne
    @JoinColumn(name="id_odonto")
    private Odontologo odonto;
    @ManyToOne
    @JoinColumn(name="id_pacien")
    private Paciente pacien;
    
    public Turno() {
    }

    public Turno(int idTurno, Date fechaTurno, String horaTurno, String afeccion) {
        this.idTurno = idTurno;
        this.fechaTurno = fechaTurno;
        this.horaTurno = horaTurno;
        this.afeccion = afeccion;
    }

    public int getIdTurno() {
        return idTurno;
    }

    public void setIdTurno(int idTurno) {
        this.idTurno = idTurno;
    }

    public Date getFechaTurno() {
        return fechaTurno;
    }
    
    public LocalDate getFechaTurnoFormateada(){
        
        LocalDateTime conv = LocalDateTime.ofInstant(this.fechaTurno.toInstant(), ZoneId.systemDefault());
        LocalDate dateObtenida = conv.toLocalDate();
        
        return dateObtenida;
    }

    public void setFechaTurno(Date fechaTurno) {
        this.fechaTurno = fechaTurno;
    }
    
    public void setFechaTurno(String fechaTurno){
        DateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date fechaFormateada;
            fechaFormateada = formato.parse(fechaTurno);
            this.fechaTurno = fechaFormateada;
        } catch (ParseException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    

    public String getHoraTurno() {
        return horaTurno;
    }

    public void setHoraTurno(String horaTurno) {
        this.horaTurno = horaTurno;
    }

    public String getAfeccion() {
        return afeccion;
    }

    public void setAfeccion(String afeccion) {
        this.afeccion = afeccion;
    }

    public Odontologo getOdonto() {
        return odonto;
    }

    public Paciente getPacien() {
        return pacien;
    }

    public void setOdonto(Odontologo odonto) {
        this.odonto = odonto;
    }

    public void setPacien(Paciente pacien) {
        this.pacien = pacien;
    }
    
    
}
