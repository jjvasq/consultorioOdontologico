package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Secretario;
import logica.Turno;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

/**
 * @author JV7859
 */
public class ControladoraPersistencia {
    
    HorarioJpaController horaJPA = new HorarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacJPA = new PacienteJpaController();
    PersonaJpaController persJPA = new PersonaJpaController();
    ResponsableJpaController respJPA = new ResponsableJpaController();
    SecretarioJpaController secreJPA = new SecretarioJpaController();
    TurnoJpaController turnJPA = new TurnoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();

    public void crearUsuario(Usuario usu) {
        usuJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }
    
    public void borrarUsuario(int id){
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario obtenerUsuario(int id) {
        return (Usuario)usuJPA.findUsuario(id);
    }
    
    /**public Usuario obtenerUsuario(String nombre) {
        return (Usuario)usuJPA.
    }*/

    public void editarUsuario(Usuario usu) {
        try {
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearOdontologo(Odontologo odonto) {
        odontoJPA.create(odonto);
    }

    public List<Odontologo> getOdontologos() {
        return odontoJPA.findOdontologoEntities();
    }

    public void borrarOdontologo(int id) {
        try {
            odontoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Odontologo obtenerOdontologo(int id) {
        return (Odontologo) odontoJPA.findOdontologo(id);
    }

    public void editarOdontologo(Odontologo odon) {
        try {
            odontoJPA.edit(odon);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Paciente> getPacientes() {
        return pacJPA.findPacienteEntities();
    }

    public void crearPaciente(Paciente pac) {
        pacJPA.create(pac);
    }

    public void borrarPaciente(int id) {
        try {
            pacJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Paciente obtenerPaciente(int id) {
        return (Paciente) pacJPA.findPaciente(id);
    }


    public void editarPaciente(Paciente pac) {
        try {
            pacJPA.edit(pac);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public void crearResponsable(Responsable resp) {
        respJPA.create(resp);
    }

    public void borrarResponsable(int idResp) {
        try {
            respJPA.destroy(idResp);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearHorario(Horario hora) {
        horaJPA.create(hora);
    }

    public void borrarHorario(int idHorario) {
        try {
            horaJPA.destroy(idHorario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Secretario> getSecretarios() {
        return secreJPA.findSecretarioEntities();
    }

    /*
    public void crearSecretario(Secretario sec) {
        secreJPA.create(sec);
    }*/

    public void crearSecretario(Secretario sec) {
        secreJPA.create(sec);
    }

    public void borrarSecretario(int id) {
        try {
            secreJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Secretario obtenerSecretario(int id) {
        return secreJPA.findSecretario(id);
    }

    public void editarSecretario(Secretario sec) {
        try {
            secreJPA.edit(sec);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> getTurnos() {
        return turnJPA.findTurnoEntities();
    }

    public void crearTurno(Turno tur) {
        turnJPA.create(tur);
    }

    public Turno obtenerTurno(int id) {
        return turnJPA.findTurno(id);
    }

    public void editarTurno(Turno tur) {
        try {
            turnJPA.edit(tur);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarTurno(int id) {
        try {
            turnJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
