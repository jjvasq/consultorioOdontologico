package servlets.odontologo;

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
import logica.Odontologo;
import logica.Usuario;

/**
 * @author JV7859
 */
@WebServlet(name = "SvOdontoUsuario", urlPatterns = {"/SvOdontoUsuario"})
public class SvOdontoUsuario extends HttpServlet {

    Controladora control = new Controladora();
    int idOdontologo;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        idOdontologo = Integer.parseInt(request.getParameter("id"));
        
        Odontologo odonto = control.obtenerOdontologo(idOdontologo);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("odontologo", odonto);
        
        response.sendRedirect("altaOdontoUsuario.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsuario = request.getParameter("nombreUsuario");
        String pass = request.getParameter("pass");
        String rol = request.getParameter("rol");
        
        Usuario usu = new Usuario();
        Odontologo odonto = control.obtenerOdontologo(idOdontologo);
        
        FuncionesGrales fcgral = new FuncionesGrales();
        String passHash = fcgral.hash(pass);
        
        usu.setNombreUsuario(nombreUsuario);
        usu.setPass(passHash);
        usu.setRol(rol);
        
        control.crearUsuario(usu);
        odonto.setUnUsuario(usu);
        
        control.editarOdontologo(odonto);
               
        response.sendRedirect("SvOdontologos");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
