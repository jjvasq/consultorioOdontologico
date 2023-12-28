<%-- 
    Document   : altaResponsable
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

<!--"h1>Esto es una prueba de componentes</h1-->
    <%
        Paciente pac = (Paciente)request.getSession().getAttribute("paciente");
    %>

    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-1">Alta Responsable</h1>
        <p class="text-gray-800">Apartado para dar de alta al Responsable Correspondiente al paciente: <strong><%=pac.getApellido()%></strong>, <%=pac.getNombre()%>  </p>
        <hr>
    </div>
    <form class="user" action="SvResponsable" method="POST">
        <div class="form-group row">
            <div class="col-md-3 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                    placeholder="DNI">
            </div>
            <div class="col-md-5 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre">
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-5 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Teléfono">
            </div>
            <div class="col-md-7 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección">
            </div>
            
        </div>
        <div class="form-group row mb-3">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="tipoResponsable">Seleccione Tipo Responsable:</label>
                    <select  class="form-control" id="tipoResponsable" name="tipoResponsable">
                        <option value="Padre">Padre</option>
                        <option value="Madre">Madre</option>
                        <option value="Tutor">Tutor</option>
                        <option value="Encargado">Encargado</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6 mt-4">
                <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                    placeholder="">
            </div>
        </div>
        <hr>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Responsable
        </button>
        <hr>
    </form>

<%@include file="components/bodyFinal.jsp" %>