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
@WebServlet(name = "SvCambioPass", urlPatterns = {"/SvCambioPass"})
public class SvCambioPass extends HttpServlet {

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
        miSession.setAttribute("usuarioCambioPass", usu);
        
        response.sendRedirect("cambioPassUsuarioAdmin.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pass = request.getParameter("pass");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Usuario usuC = control.obtenerUsuario(id);
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        
        usuC.setPass(passHash);
        
        control.editarUsuario(usuC);
        
        response.sendRedirect("SvUsuarios");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
