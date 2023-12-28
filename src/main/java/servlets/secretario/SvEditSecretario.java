package servlets.secretario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Secretario;

/**
 * @author JV7859
 */
@WebServlet(name = "SvEditSecretario", urlPatterns = {"/SvEditSecretario"})
public class SvEditSecretario extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Secretario sec = control.obtenerSecretario(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("secEdit", sec);
        
        response.sendRedirect("editarSecretarios.jsp");
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
        String sector = request.getParameter("sector");
        
        Secretario sec = (Secretario)request.getSession().getAttribute("secEdit");
        
        sec.setApellido(apellido);
        sec.setDireccion(direccion);
        sec.setDni(dni);
        sec.setFechaNac(fechaNac);
        sec.setNombre(nombre);
        sec.setSector(sector);
        sec.setTelefono(telefono);
        
        control.editarSecretario(sec);
        
        response.sendRedirect("SvSecretarios");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
