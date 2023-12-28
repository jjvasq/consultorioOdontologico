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
@WebServlet(name = "SvHorario", urlPatterns = {"/SvHorario"})
public class SvHorario extends HttpServlet {

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
        
        response.sendRedirect("altaHorario.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String horaInicio = request.getParameter("horaInicio");
        String horaFin = request.getParameter("horaFin");
        
        Horario hora = new Horario();
        
        hora.setInicio(horaInicio);
        hora.setFin(horaFin);
        
        control.crearHorario(hora);
        Odontologo odonto = control.obtenerOdontologo(idOdontologo);
        odonto.setUnHorario(hora);
        
        control.editarOdontologo(odonto);
        
        response.sendRedirect("SvOdontologos");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
