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
import logica.Responsable;

/**
 *
 * @author Juanjo
 */
@WebServlet(name = "SvShowResponsable", urlPatterns = {"/SvShowResponsable"})
public class SvShowResponsable extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        //System.out.println("Nombre del responsable Debería aparecer Marita 2: es-> "+ id);
        
        Paciente pac = control.obtenerPaciente(id);
        Responsable resp = pac.getUnResponsable();
        //System.out.println("Nombre del responsable Debería aparecer Marita : es-> "+ resp.getNombre());
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("paciente", pac);
        miSession.setAttribute("responsable", resp);
        
        response.sendRedirect("showResponsable.jsp");
        
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
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
