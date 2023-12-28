package logica;

//import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Entity;

/**
 * @author JV7859
 */
@Entity
public class Responsable extends Persona {

    //private int idResponsable;
    private String tipoResponsable;

    public Responsable() {
    }

    public Responsable(String tipoResponsable, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        super(id, dni, nombre, apellido, telefono, direccion, fechaNac);
        this.tipoResponsable = tipoResponsable;
    }

    
    /*public int getIdResponsable() {
        return idResponsable;
    }

    public void setIdResponsable(int idResponsable) {
        this.idResponsable = idResponsable;
    }*/

    public String getTipoResponsable() {
        return tipoResponsable;
    }

    public void setTipoResponsable(String tipoResponsable) {
        this.tipoResponsable = tipoResponsable;
    }
}
