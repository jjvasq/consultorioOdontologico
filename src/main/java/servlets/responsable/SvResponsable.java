package servlets.responsable;

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
import logica.Responsable;

/**
 * @author Juanjo
 */
@WebServlet(name = "SvResponsable", urlPatterns = {"/SvResponsable"})
public class SvResponsable extends HttpServlet {

    Controladora control = new Controladora();
    int idPaciente;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        idPaciente = id;
        Paciente pac = control.obtenerPaciente(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("paciente", pac);
        
        response.sendRedirect("altaResponsable.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNac = request.getParameter("fechaNac");
        String tipoResponsable = request.getParameter("tipoResponsable");
        
        System.out.println("Tipo responsable: "+ tipoResponsable);
        
        Responsable resp = control.crearResponsable(nombre, apellido, dni, telefono, direccion, fechaNac, tipoResponsable);
        
        Paciente pac = control.obtenerPaciente(idPaciente);
        
        pac.setUnResponsable(resp);
        
        control.editarPaciente(pac);
        
        response.sendRedirect("SvPacientes");
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
