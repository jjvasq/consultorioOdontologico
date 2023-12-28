<%-- 
    Document   : altaHorario
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%
        Odontologo odon = (Odontologo)request.getSession().getAttribute("odontologo");
    %>

    <div class="card col-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-1">Alta Horario Odontólogo</h1>
                <p class="text-gray-800">Apartado para dar de alta al Horario correspondiente al odontologo: <strong class="text-primary"><%=odon.getApellido()%>, <%=odon.getNombre()%></strong></p>
                <hr>
                <p class="text-gray-600">Recordar que la hora debe ser en formato 24 hs.<strong>(Ej: 8:00, 20:00, etc)</strong></p>
                <hr>
            </div>
            <form class="user" action="SvHorario" method="POST">
                <div class="form-group row">
                    <div class="col">
                        <input type="text" class="form-control form-control-user" id="horaInicio" name="horaInicio"
                            placeholder="Hora Inicio">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col">
                        <input type="text" class="form-control form-control-user" id="horaFin" name="horaFin"
                            placeholder="Hora Fin">
                    </div>
                </div>
                <hr>
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Crear Horario
                </button>
                <hr>
            </form>
        </div>
    </div>
    
    
<%@include file="components/bodyFinal.jsp" %>