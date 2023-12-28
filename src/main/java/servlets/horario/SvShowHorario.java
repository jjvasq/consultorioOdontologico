package servlets.horario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Horario;
import logica.Odontologo;

/**
 * @author JV7859
 */
@WebServlet(name = "SvShowHorario", urlPatterns = {"/SvShowHorario"})
public class SvShowHorario extends HttpServlet {

    Controladora control = new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Odontologo odon = control.obtenerOdontologo(id);
        Horario hora = odon.getUnHorario();
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("odontologo", odon);
        miSession.setAttribute("horario", hora);
        
        response.sendRedirect("showHorario.jsp");
        
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
