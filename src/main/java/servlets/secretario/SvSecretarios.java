package servlets.secretario;

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
import logica.Secretario;

/**
 * @author Juanjo
 */
@WebServlet(name = "SvSecretarios", urlPatterns = {"/SvSecretarios"})
public class SvSecretarios extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Secretario> listaSecretarios = new ArrayList<Secretario>();
        
        listaSecretarios = control.getSecretarios();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("listaSecretarios", listaSecretarios);
        
        response.sendRedirect("verSecretarios.jsp");
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
        String sector = request.getParameter("sector");
        
        Secretario sec = new Secretario();
        
        sec.setApellido(apellido);
        sec.setDireccion(direccion);
        sec.setDni(dni);
        sec.setFechaNac(fechaNac);
        sec.setNombre(nombre);
        sec.setSector(sector);
        sec.setTelefono(telefono);
        
        control.crearSecretario(sec);
        
        response.sendRedirect("SvSecretarios");
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
