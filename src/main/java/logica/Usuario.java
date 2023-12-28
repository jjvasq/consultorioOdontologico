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
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int idUsuario;
    private String nombreUsuario;
    private String pass;
    private String rol;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombreUsuario, String pass, String rol) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.pass = pass;
        this.rol = rol;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public String getRol(){
        return rol;
    }
    
    public void setRol(String rol){
        this.rol = rol;
    }
}
