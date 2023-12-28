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
import logica.Usuario;

/**
 * @author JV7859
 */
@WebServlet(name = "SvShowSecUsuario", urlPatterns = {"/SvShowSecUsuario"})
public class SvShowSecUsuario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Secretario sec = control.obtenerSecretario(id);
        Usuario usu = sec.getUnUsuario();
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("secretario", sec);
        miSession.setAttribute("usuario", usu);
        
        response.sendRedirect("showUsuarioSec.jsp");
        
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
