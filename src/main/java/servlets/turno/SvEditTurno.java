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
 * @author JV7859
 */
@WebServlet(name = "SvEditTurno", urlPatterns = {"/SvEditTurno"})
public class SvEditTurno extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Turno tur = control.obtenerTurno(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("turnoEdit", tur);
        
        response.sendRedirect("editarTurnos.jsp");
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fecha = request.getParameter("fechaTurno");
        String horaTurno = request.getParameter("horaTurno");
        String afeccion = request.getParameter("afeccion");
        
        Turno tur = (Turno)request.getSession().getAttribute("turnoEdit");
        
        /*
        Odontologo odonto = tur.getOdonto();
        odonto.getListaTurnos().remove(tur);
        
        Paciente pac = tur.getPacien();
        pac.getListaTurnos().remove(tur);*/
        
        tur.setAfeccion(afeccion);
        tur.setFechaTurno(fecha);
        tur.setHoraTurno(horaTurno);
        
        control.editarTurno(tur);
        
        /*
        odonto.getListaTurnos().add(tur);
        pac.getListaTurnos().add(tur);
        
        control.editarOdontologo(odonto);
        control.editarPaciente(pac);
        */
        response.sendRedirect("SvTurnos");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
