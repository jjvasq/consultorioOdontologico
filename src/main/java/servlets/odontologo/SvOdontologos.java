/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets.odontologo;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;

/**
 *
 * @author Juanjo
 */
@WebServlet(name = "SvOdontologos", urlPatterns = {"/SvOdontologos"})
public class SvOdontologos extends HttpServlet {

    Controladora control = new Controladora();
    //Date fechaFormateada;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Odontologo> listaOdontologos = new ArrayList<Odontologo>();
        
        listaOdontologos = control.getOdontologos();
        
        HttpSession miSession = request.getSession();
        
        miSession.setAttribute("listaOdontologos", listaOdontologos);
        
        //Testeo.
        //System.out.println("Apellido Odontologo: "+ ((Odontologo)listaOdontologos.get(0)).getApellido());
        
        response.sendRedirect("verOdontologos.jsp");
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String fechaNac = request.getParameter("fechaNac");
        String especialidad = request.getParameter("especialidad");
        
        control.crearOdontologo(nombre, apellido, dni, telefono, direccion, fechaNac, especialidad);
        
        response.sendRedirect("SvOdontologos");
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
