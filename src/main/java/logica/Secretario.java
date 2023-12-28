package logica;

//import java.time.LocalDate;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 * @author JV7859
 */
@Entity
public class Secretario extends Persona {

    //private int idSecretario;
    private String sector;
    @OneToOne
    private Usuario unUsuario;

    public Secretario() {
    }

    public Secretario(String sector, Usuario unUsuario, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        super(id, dni, nombre, apellido, telefono, direccion, fechaNac);
        this.sector = sector;
        this.unUsuario = unUsuario;
    }

    
    /*public int getIdSecretario() {
        return idSecretario;
    }

    public void setIdSecretario(int idSecretario) {
        this.idSecretario = idSecretario;
    }*/

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public Usuario getUnUsuario() {
        return unUsuario;
    }

    public void setUnUsuario(Usuario unUsuario) {
        this.unUsuario = unUsuario;
    }
    
    
}
