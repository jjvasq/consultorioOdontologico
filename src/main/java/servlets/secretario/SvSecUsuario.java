package servlets.secretario;

import funcionesVarias.FuncionesGrales;
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
@WebServlet(name = "SvSecUsuario", urlPatterns = {"/SvSecUsuario"})
public class SvSecUsuario extends HttpServlet {

    Controladora control = new Controladora();
    Secretario sec;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        sec = control.obtenerSecretario(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("secretario", sec);
        
        response.sendRedirect("altaSecUsuario.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsuario = request.getParameter("nombreUsuario");
        String pass = request.getParameter("pass");
        String rol = request.getParameter("rol");
        
        Usuario usu = new Usuario();
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        usu.setNombreUsuario(nombreUsuario);
        usu.setPass(passHash);
        usu.setRol(rol);
        
        control.crearUsuario(usu);
        sec.setUnUsuario(usu);
        
        control.editarSecretario(sec);
        
        response.sendRedirect("SvSecretarios");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
