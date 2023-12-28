package servlets;

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
import logica.Usuario;

/**
 * @author JV7859
 */
@WebServlet(name = "SvEditUsuario", urlPatterns = {"/SvEditUsuario"})
public class SvEditUsuario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Usuario usu = control.obtenerUsuario(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("usuarioEdit", usu);
        
        response.sendRedirect("editarUsuarios.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        String nombreUsuario = request.getParameter("nombreUsuario");
        //String pass = request.getParameter("pass");
        String rol = request.getParameter("rol");
        
        Usuario usu = (Usuario) request.getSession().getAttribute("usuarioEdit");
        
        //FuncionesGrales fcgral = new FuncionesGrales();
        //String passHash = fcgral.hash(pass);
        
        usu.setNombreUsuario(nombreUsuario);
        //usu.setPass(passHash);
        usu.setRol(rol);
        
        control.editarUsuario(usu);
        
        response.sendRedirect("SvUsuarios");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
