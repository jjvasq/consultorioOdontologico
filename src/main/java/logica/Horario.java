package logica;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * @author JV7859
 */
@Entity
public class Horario implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idHorario;
    private String inicio;
    private String fin;

    public Horario() {
    }

    public Horario(int idHorario, String inicio, String fin) {
        this.idHorario = idHorario;
        this.inicio = inicio;
        this.fin = fin;
    }

    public int getIdHorario() {
        return idHorario;
    }

    public void setIdHorario(int idHorario) {
        this.idHorario = idHorario;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }
    
    
}
