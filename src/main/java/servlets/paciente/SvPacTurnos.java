package servlets.paciente;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;
import logica.Turno;

/**
 * @author JV7859
 */
@WebServlet(name = "SvPacTurnos", urlPatterns = {"/SvPacTurnos"})
public class SvPacTurnos extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Paciente pac = control.obtenerPaciente(id);
        
        List<Turno> listaTurnos = pac.getListaTurnos();
        
        //Tengo que llamar, tener atención con los nulos o las listas vacías..
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaTurnos", listaTurnos);
        miSession.setAttribute("paciente",pac);
        
        response.sendRedirect("showTurnosPac.jsp");
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
