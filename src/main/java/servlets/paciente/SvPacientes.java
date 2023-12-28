package servlets.paciente;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SvPacientes", urlPatterns = {"/SvPacientes"})
public class SvPacientes extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Paciente> listaPacientes = new ArrayList<Paciente>();
        
        listaPacientes = control.getPacientes();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("listaPacientes", listaPacientes);
        
        response.sendRedirect("verPacientes.jsp");
        
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
        String tipoSangre = request.getParameter("tipoSangre");
        int obraS = Integer.parseInt(request.getParameter("tieneOS"));
        boolean tieneOS = true;
        if(obraS == 0)
            tieneOS = false;
            
        
        control.crearPaciente(nombre, apellido, dni, telefono, direccion, fechaNac, tipoSangre, tieneOS);
        
        response.sendRedirect("SvPacientes");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
