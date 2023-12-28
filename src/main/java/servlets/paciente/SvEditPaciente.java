package servlets.paciente;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

/**
 * @author JV7859
 */
@WebServlet(name = "SvEditPaciente", urlPatterns = {"/SvEditPaciente"})
public class SvEditPaciente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Paciente pac = control.obtenerPaciente(id);
        
        System.out.println("El nombre del paciente a Editar es: "+ pac.getNombre());
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("pacienteEdit", pac);
        
        response.sendRedirect("editarPacientes.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNac = request.getParameter("fechaNac");
        String tipoSangre = request.getParameter("tipoSangre");
        int obraS = Integer.parseInt(request.getParameter("tieneOS"));
        boolean tieneOS = true;
        if(obraS == 0)
            tieneOS = false;
        
        
        Paciente pac = (Paciente) request.getSession().getAttribute("pacienteEdit");
        
        pac.setApellido(apellido);
        pac.setDireccion(direccion);
        pac.setDni(dni);
        pac.setFechaNac(fechaNac);
        pac.setNombre(nombre);
        pac.setTelefono(telefono);
        pac.setTipoSangre(tipoSangre);
        pac.setTieneOS(tieneOS);
        
        control.editarPaciente(pac);
        
        response.sendRedirect("SvPacientes");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
