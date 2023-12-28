package servlets.horario;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Odontologo;

/**
 * @author JV7859
 */
@WebServlet(name = "SvElimHorario", urlPatterns = {"/SvElimHorario"})
public class SvElimHorario extends HttpServlet {

    Controladora control = new Controladora();
    int idOdonto, idHorario;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        idOdonto = Integer.parseInt(request.getParameter("idOdonto"));
        idHorario = Integer.parseInt(request.getParameter("idHorario"));
        
        response.sendRedirect("elimHorario.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Odontologo odon = control.obtenerOdontologo(idOdonto);
        
        odon.setUnHorario(null);
        
        control.editarOdontologo(odon);
        
        control.borrarHorario(idHorario);
        
        response.sendRedirect("SvOdontologos");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
