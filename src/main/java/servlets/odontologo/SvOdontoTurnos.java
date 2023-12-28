package servlets.odontologo;

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
import logica.Odontologo;
import logica.Turno;

/**
 * @author JV7859
 */
@WebServlet(name = "SvOdontoTurnos", urlPatterns = {"/SvOdontoTurnos"})
public class SvOdontoTurnos extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Odontologo odonto = control.obtenerOdontologo(id);
        
        List<Turno> listaTurnos = odonto.getListaTurnos();
        
        //Tengo que llamar, tener atención con los nullos o las listas vacías..
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaTurnos", listaTurnos);
        miSession.setAttribute("odonto", odonto);
        
        response.sendRedirect("showTurnosOdonto.jsp");
        
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
