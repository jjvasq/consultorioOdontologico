<%-- 
    Document   : EditarSecretario
    Created on : 14 dic 2023, 09:14
    Author     : JV7859
--%>

<%@page import="logica.Secretario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-1">Editar Secretario </h1>
        <p class="text-gray-800">Apartado para Editar un Secretario</p>
        <hr>
    </div>

    <%
        Secretario sec = new Secretario();
        
        sec = (Secretario) request.getSession().getAttribute("secEdit");
    %>

    <form class="user" action="SvEditSecretario" method="POST">
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                    placeholder="DNI" value="<%=sec.getDni() %>">
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre" value="<%=sec.getNombre() %>">
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido" value="<%=sec.getApellido() %>">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=sec.getTelefono() %>">
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección" value="<%=sec.getDireccion() %>">
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                    placeholder="Fecha Nacimiento" value="<%=sec.getFechaNacFormateada() %>">
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control form-control-user" id="sector" name="sector"
                placeholder="Sector" value="<%=sec.getSector() %>">
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Editar Secretario
        </button>
        <hr>
    </form>

<%@include file="components/bodyFinal.jsp" %>