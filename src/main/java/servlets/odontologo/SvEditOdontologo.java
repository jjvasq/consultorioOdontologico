package servlets.odontologo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;

/**
 * @author Juanjo
 */
@WebServlet(name = "SvEditOdontologo", urlPatterns = {"/SvEditOdontologo"})
public class SvEditOdontologo extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
     
        Odontologo odonto = control.obtenerOdontologo(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("odontoEdit", odonto);
        
        response.sendRedirect("editarOdontologos.jsp");
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
        String especialidad = request.getParameter("especialidad");
        
        Odontologo odon = (Odontologo)request.getSession().getAttribute("odontoEdit");
        
        odon.setApellido(apellido);
        odon.setDireccion(direccion);
        odon.setDni(dni);
        odon.setEspecialidad(especialidad);
        odon.setFechaNac(fechaNac);
        odon.setNombre(nombre);
        odon.setTelefono(telefono);
        
        control.editarOdontologo(odon);
        
        response.sendRedirect("SvOdontologos");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
