package logica;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
//import java.time.LocalDate;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * @author JV7859
 */
@Entity
@Inheritance (strategy=InheritanceType.TABLE_PER_CLASS)
public class Persona implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String dni;
    private String nombre;
    private String apellido;
    private String telefono;
    private String direccion;
    
    @Temporal(TemporalType.DATE)
    private Date fechaNac;

    public Persona() {
    }

    public Persona(int id,String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        this.id = id;
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.direccion = direccion;
        this.fechaNac = fechaNac;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFechaNac() {
        return fechaNac;
    }
    
    public LocalDate getFechaNacFormateada(){
        
        LocalDateTime conv = LocalDateTime.ofInstant(this.fechaNac.toInstant(), ZoneId.systemDefault());
        LocalDate dateObtenida = conv.toLocalDate();
        
        return dateObtenida;
    }

    public void setFechaNac(Date fechaNac) {
        this.fechaNac = fechaNac;
    }
    
    public void setFechaNac(String fechaNac){
        DateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date fechaFormateada;
            fechaFormateada = formato.parse(fechaNac);
            this.fechaNac = fechaFormateada;
        } catch (ParseException ex) {
            Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
