package servlets;

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
@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.sendRedirect("login.jsp");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        boolean band = false;
        int retorno = 0;
        String mensaje = "Éxito";
        
        String nombreUsuario = request.getParameter("nombre");
        String pass = request.getParameter("pass");
        
        retorno = control.verificarUsuarioII(nombreUsuario, pass);
        
        /** Control
        if(retorno == 0 && mensaje.equals("Éxito"))
            System.out.println("No está trayendo nada del VerificarII");
        */
        switch(retorno){
            case 0:
                mensaje = "Usuario Incorrecto";
            break;
            case 1:
                mensaje = "Éxito";
            break;
            case 2:
                mensaje = "Contraseña Incorrecta";
            break;
            default:
                mensaje = "No debería entrar acá";
        }
        /** Controles
        System.out.println("El valor de retorno es: "+retorno);
        System.out.println("El mensaje es: "+mensaje);
        */
        HttpSession miSession = request.getSession(true);
        miSession.setAttribute("mensaje", mensaje);
        if(retorno == 1){
            miSession.setAttribute("Usuario", nombreUsuario);
            Usuario usu = control.obtenerUsuarioVerificado(nombreUsuario);
            //System.out.println("Id del Usuario: "+usu.getIdUsuario());
            miSession.setAttribute("usuarioCompleto", usu);
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("loginError.jsp");
        }
        
        /**
        band = control.verificarUsuario(nombreUsuario, pass);
        
        if(band == true){
            HttpSession miSession = request.getSession(true);
            miSession.setAttribute("Usuario", nombreUsuario);
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("loginError.jsp");
        }*/
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
