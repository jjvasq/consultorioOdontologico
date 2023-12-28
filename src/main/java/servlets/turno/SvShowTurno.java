package servlets.turno;

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
import logica.Paciente;
import logica.Turno;

/**
 * @author Juanjo
 */
@WebServlet(name = "SvShowTurno", urlPatterns = {"/SvShowTurno"})
public class SvShowTurno extends HttpServlet {

    Controladora control = new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Turno tur = control.obtenerTurno(id);
        
        Paciente pac = tur.getPacien();
        Odontologo odonto = tur.getOdonto();
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("turno", tur);
        miSession.setAttribute("paciente", pac);
        miSession.setAttribute("odontologo", odonto);
        
        response.sendRedirect("showTurno.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
