package servlets.turno;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SvAltaTurno", urlPatterns = {"/SvAltaTurno"})
public class SvAltaTurno extends HttpServlet {

    Controladora control = new Controladora();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Paciente> listaPacientes;
        List<Odontologo> listaOdontologos;
        
        listaPacientes = control.getPacientes();
        listaOdontologos = control.getOdontologos();
        
        HttpSession miSession = request.getSession();
        miSession.setAttribute("listaPacientes", listaPacientes);
        miSession.setAttribute("listaOdontologos", listaOdontologos);
        
        response.sendRedirect("altaTurnos.jsp");
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idPaciente = Integer.parseInt(request.getParameter("paciente"));
        int idOdontologo = Integer.parseInt(request.getParameter("odontologo"));
        
        String fecha = request.getParameter("fechaTurno");
        String horaTurno = request.getParameter("horaTurno");
        String afeccion = request.getParameter("afeccion");
        
        Paciente pac = control.obtenerPaciente(idPaciente);
        Odontologo odonto = control.obtenerOdontologo(idOdontologo);
        
        Turno tur = new Turno();
        
        tur.setAfeccion(afeccion);
        tur.setFechaTurno(fecha);
        tur.setHoraTurno(horaTurno);
        tur.setOdonto(odonto);
        tur.setPacien(pac);
        
        control.crearTurno(tur);
        
        /*List<Turno> listaTurnoOdonto = new ArrayList<Turno>();
        listaTurnoOdonto = odonto.getListaTurnos();
        listaTurnoOdonto.add(tur);
        
        odonto.setListaTurnos(listaTurnoOdonto);
        
        control.editarOdontologo(odonto);
        
        List<Turno> listaTurnoPac = new ArrayList<Turno>();
        listaTurnoPac = pac.getListaTurnos();
        listaTurnoPac.add(tur);
        
        pac.setListaTurnos(listaTurnoPac);
        
        control.editarPaciente(pac);
        */
        
        response.sendRedirect("SvTurnos");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
