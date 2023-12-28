<%-- 
    Document   : altaUsuarios
    Created on : 17 dic 2023, 16:41
    Author     : JV7859
--%>

<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%
        List<Paciente> listaPacientes = (List)request.getSession().getAttribute("listaPacientes");
        List<Odontologo> listaOdontologos = (List)request.getSession().getAttribute("listaOdontologos");
    %>
    

    <div class="card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-primary mb-1">Alta Turno </h1>
                <p class="text-gray-800">Formato para el horario (Ej: 8:00 - 8:30 - 15:30 ...)</p>
                <hr>
            </div>
            <form class="user" action="SvAltaTurno" method="POST">
                <div class="form-group row">
                     <div class="col-lg-12 mg-lg-0">
                        <input type="date" class="form-control form-control-user" id="fechaTurno" name="fechaTurno"
                            placeholder="Fecha Turno">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="horaTurno" name="horaTurno"
                            placeholder="Hora Turno">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="afeccion" name="afeccion"
                            placeholder="Afección">
                    </div>
                </div>
                <div class="form-group row mx-2">
                    <label for="rol">Seleccione Paciente</label>
                    <select  class="form-control" id="paciente" name="paciente">
                        
                        <%for(Paciente pac : listaPacientes){%>
                            <option value="<%=pac.getId() %>"><%=pac.getApellido() %>, <%=pac.getNombre() %></option>
                        <%}%>
                        
                    </select>
                </div>
                <div class="form-group row mx-2">
                    <label for="rol">Seleccione Odontólogo: </label>
                    <select  class="form-control" id="odontologo" name="odontologo">
                        
                        <%for(Odontologo odonto : listaOdontologos){%>
                            <option value="<%=odonto.getId() %>"><%=odonto.getApellido() %>, <%=odonto.getNombre() %></option>
                        <%}%>
                        
                    </select>
                </div>
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Crear Turno
                </button>
                <hr>
            </form>
        </div>
    </div>
    

<%@include file="components/bodyFinal.jsp" %>
