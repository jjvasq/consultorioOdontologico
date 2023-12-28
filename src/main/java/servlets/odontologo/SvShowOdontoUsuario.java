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
import logica.Usuario;

/**
 * @author JV7859
 */
@WebServlet(name = "SvShowOdontoUsuario", urlPatterns = {"/SvShowOdontoUsuario"})
public class SvShowOdontoUsuario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Odontologo odonto = control.obtenerOdontologo(id);
        Usuario usu = odonto.getUnUsuario();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("odontologo", odonto);
        miSession.setAttribute("usuario", usu);
        
        response.sendRedirect("showUsuarioOdonto.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
