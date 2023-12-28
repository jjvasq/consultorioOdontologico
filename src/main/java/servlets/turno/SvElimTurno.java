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
@WebServlet(name = "SvElimTurno", urlPatterns = {"/SvElimTurno"})
public class SvElimTurno extends HttpServlet {

    Controladora control = new Controladora();
    Turno tur;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        tur = control.obtenerTurno(id);
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("turnoElim", tur);
        
        response.sendRedirect("elimTurno.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Paciente pac = tur.getPacien();
        pac.getListaTurnos().remove(tur);
        control.editarPaciente(pac);
        
        Odontologo odonto = tur.getOdonto();
        odonto.getListaTurnos().remove(tur);
        control.editarOdontologo(odonto);
        
        control.borrarTurno(tur.getIdTurno());
        
        response.sendRedirect("SvTurnos");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
