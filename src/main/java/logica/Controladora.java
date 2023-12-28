package logica;

import funcionesVarias.FuncionesGrales;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import persistencia.ControladoraPersistencia;

/**
 * @author JV7859
 */
public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    Date fechaFormateada;
    
    public void crearUsuario(String nombreUsuario, String pass, String rol){
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        Usuario usu = new Usuario();
        usu.setNombreUsuario(nombreUsuario);
        usu.setPass(passHash);
        usu.setRol(rol);
        controlPersis.crearUsuario(usu);
    }
    
    //sobrecarga de parámetros, necesito el Usuario para setearlo.
    public void crearUsuario(Usuario usu) {
        controlPersis.crearUsuario(usu);
    }
    
    public List<Usuario> getUsuarios(){
        return controlPersis.getUsuarios();
    }
    
    public void borrarUsuario(int id){
        controlPersis.borrarUsuario(id);
    }

    public Usuario obtenerUsuario(int id) {
        return controlPersis.obtenerUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public boolean verificarUsuario(String nombreUsuario, String pass) {
        boolean retorno = false;
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        List<Usuario> listaUsuarios = this.getUsuarios();
        
        for(Usuario usu : listaUsuarios){
            if((usu.getNombreUsuario().equals(nombreUsuario)) && (usu.getPass().equals(passHash)))
                retorno = true;
        }
        
        return retorno;
    }
    
    /**
     * @param nombreUsuario
     * @param pass
     * @return un int 0- No existe 1- Éxito 2- Contraseña incorrecta
     */
    public int verificarUsuarioII(String nombreUsuario, String pass) {
        int retorno = 0;
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        List<Usuario> listaUsuarios = this.getUsuarios();
        
        Usuario usu;
        for(int i=0; i<listaUsuarios.size();i++){
           usu = listaUsuarios.get(i);
           if(usu.getNombreUsuario().equals(nombreUsuario)){
               if(usu.getPass().equals(passHash)){
                   retorno = 1;
                   i = listaUsuarios.size();//Corte
               }
               else{
                   retorno = 2;
               }
           }
        }
        return retorno;
    }
    
    /**
     * @param nombre
     * @return Usuario Buscado pero ya confirmada su existencia
     */
    public Usuario obtenerUsuarioVerificado(String nombre){
        Usuario usuBuscado = new Usuario();
        
        List<Usuario> listaUsuarios = this.getUsuarios();
        
        for(Usuario usu : listaUsuarios){
            if(usu.getNombreUsuario().equals(nombre))
                usuBuscado = usu;
        }
        
        return usuBuscado;
    }
    

    public void crearOdontologo(String nombre, String apellido, String dni, String telefono, String direccion, String fechaNac, String especialidad){
        
        try {    
            Odontologo odonto = new Odontologo();

            /**
            DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDate fecha = LocalDate.parse(fechaNac, formato);
            */ 

            //Manejo de Fechas:
            DateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            fechaFormateada = formato.parse(fechaNac);
            
            
            odonto.setApellido(apellido);
            odonto.setDireccion(direccion);
            odonto.setDni(dni);
            odonto.setEspecialidad(especialidad);
            odonto.setFechaNac(fechaFormateada);
            odonto.setNombre(nombre);
            odonto.setTelefono(telefono);

            controlPersis.crearOdontologo(odonto);
        } catch (ParseException ex) {
            Logger.getLogger(Controladora.class.getName()).log(Level.SEVERE, null, ex);
        }
        
      
    }

    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologos();
    }

    public void borrarOdontologo(int id) {
        controlPersis.borrarOdontologo(id);
    }

    public Odontologo obtenerOdontologo(int id) {
        return controlPersis.obtenerOdontologo(id);
    }

    public void editarOdontologo(Odontologo odon) {
        controlPersis.editarOdontologo(odon);
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }

    public void crearPaciente(String nombre, String apellido, String dni, String telefono, String direccion, String fechaNac, String tipoSangre, boolean tieneOS) {
        
        Paciente pac = new Paciente();
        
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setDni(dni);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        pac.setFechaNac(fechaNac);
        pac.setTipoSangre(tipoSangre);
        pac.setTieneOS(tieneOS);
        
        controlPersis.crearPaciente(pac);
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }

    public Paciente obtenerPaciente(int id) {
        return controlPersis.obtenerPaciente(id);
    }

    public void editarPaciente(Paciente pac) {
        controlPersis.editarPaciente(pac);
    }

    public Responsable crearResponsable(String nombre, String apellido, String dni, String telefono, String direccion, String fechaNac, String tipoResponsable) {
        
        Responsable resp = new Responsable();
        
        resp.setApellido(apellido);
        resp.setNombre(nombre);
        resp.setDni(dni);
        resp.setDireccion(direccion);
        resp.setFechaNac(fechaNac);
        resp.setTelefono(telefono);
        resp.setTipoResponsable(tipoResponsable);
        
        controlPersis.crearResponsable(resp);
        
        return resp;
    }

    public void borrarResponsable(int idResp) {
        controlPersis.borrarResponsable(idResp);
    }

    public void crearHorario(Horario hora) {
        controlPersis.crearHorario(hora);
    }

    public void borrarHorario(int idHorario) {
        controlPersis.borrarHorario(idHorario);
    }

    public List<Secretario> getSecretarios() {
        return controlPersis.getSecretarios();
    }

    public void crearSecretario(Secretario sec) {
        controlPersis.crearSecretario(sec);
    }

    public void borrarSecretario(int id) {
        controlPersis.borrarSecretario(id);
    }

    public Secretario obtenerSecretario(int id) {
        return controlPersis.obtenerSecretario(id);
    }

    public void editarSecretario(Secretario sec) {
        controlPersis.editarSecretario(sec);
    }

    public List<Turno> getTurnos() {
        return controlPersis.getTurnos();
    }

    public void crearTurno(Turno tur) {
        controlPersis.crearTurno(tur);
    }

    public Turno obtenerTurno(int id) {
        return controlPersis.obtenerTurno(id);
    }

    public void editarTurno(Turno tur) {
        controlPersis.editarTurno(tur);
    }

    public void borrarTurno(int id) {
        controlPersis.borrarTurno(id);
    }
    
}


// Código sin uso
    /**
    public boolean verificarUsuario(String nombreUsuario, String pass) {
        boolean retorno = false;
        
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        
        //listaUsuarios = this.getUsuarios();
        listaUsuarios = controlPersis.getUsuarios();
        
        System.out.println("En Verificar Usuario: -------- ");
        System.out.println("######## El Usuario a Buscar tiene los siguientes Datos #######");
        System.out.println("Nombre Usuario: "+nombreUsuario);
        System.out.println("password: "+pass);
        System.out.println("###################################");
        if(listaUsuarios.isEmpty())
            System.out.println("La lista de Usuarios está vacía.");
        else
            System.out.println("La lista Usuarios Tiene Usuarios");
        
        for(Usuario usu : listaUsuarios){
            System.out.println("Ingresó en el For --------");
            System.out.println("Nombre Usuario: "+usu.getNombreUsuario());
            System.out.println("-----------------------");
            if(usu.getNombreUsuario().equals(nombreUsuario)){
                System.out.println("Ingresó en el primer if...");
                if(usu.getPass().equals(pass)){
                    
                    System.out.println("Ingresó en el segundo if...");
                    retorno = true;
                    System.out.println("Valor de retorno");
                    System.out.println(retorno);
                }
            }
        }
        
        return retorno;
    }*/