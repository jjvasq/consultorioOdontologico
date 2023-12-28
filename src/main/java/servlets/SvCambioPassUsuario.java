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
@WebServlet(name = "SvCambioPassUsuario", urlPatterns = {"/SvCambioPassUsuario"})
public class SvCambioPassUsuario extends HttpServlet {

    Controladora control = new Controladora();
    Usuario usu;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //System.out.println("LLega al doGet");
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        usu = control.obtenerUsuario(id);
        
        response.sendRedirect("cambioPassUsuario.jsp");
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pass = request.getParameter("pass");
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        HttpSession miSession = request.getSession();
        
        Usuario usuC = (Usuario)miSession.getAttribute("usuarioCompleto");
        
        usuC.setPass(passHash);
        
        control.editarUsuario(usuC);
        
        response.sendRedirect("login.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
