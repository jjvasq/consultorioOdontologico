package servlets.responsable;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

/**
 * @author JV7859
 */
@WebServlet(name = "SvElimResponsable", urlPatterns = {"/SvElimResponsable"})
public class SvElimResponsable extends HttpServlet {

    Controladora control = new Controladora();
    int idPac, idResp;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        idPac = Integer.parseInt(request.getParameter("idPaciente"));
        idResp = Integer.parseInt(request.getParameter("idResponsable"));
        
        response.sendRedirect("elimResponsable.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Paciente pac = control.obtenerPaciente(idPac);
        
        pac.setUnResponsable(null);
        
        control.editarPaciente(pac);
        
        control.borrarResponsable(idResp);
        
        response.sendRedirect("SvPacientes");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
