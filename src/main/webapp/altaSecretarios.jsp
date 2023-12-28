<%-- 
    Document   : altaSecretario
    Created on : 13 dic 2023, 21:14
    Author     : JV7859
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-1">Alta Secretario </h1>
        <p class="text-gray-800">Apartado para dar de alta un nuevo Secretario</p>
        <hr>
    </div>
    <form class="user" action="SvSecretarios" method="POST">
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                    placeholder="DNI">
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre">
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Teléfono">
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección">
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                    placeholder="Fecha Nacimiento">
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control form-control-user" id="sector" name="sector"
                placeholder="Sector">
        </div>
        
        
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Secretario
        </button>
        <hr>
    </form>

<%@include file="components/bodyFinal.jsp" %>