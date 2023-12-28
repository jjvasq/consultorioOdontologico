<%-- 
    Document   : altaPacientes
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

<!--"h1>Esto es una prueba de componentes</h1-->
    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-1">Alta Pacientes </h1>
        <p class="text-gray-800">Apartado para dar de alta un nuevo Paciente</p>
        <hr>
    </div>
    <form class="user" action="SvPacientes" method="POST">
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
                    placeholder="">
            </div>
        </div>
        <div class="form-group row mb-3">
            <div class="col-md-4 mb-3">
                <input type="text" class="form-control form-control-user" id="tipoSangre" name="tipoSangre"
                    placeholder="Tipo Sangre (Ej:0+) ">
            </div>
            <div class="col-md-4 ml-2">
                <label><strong>Obra Social:</strong></label>
                <div class="form-group">
                    <label class="radio-inline"><input type="radio" name="tieneOS" value="1" checked> Tiene</label>
                    <label class="ml-3 radio-inline"><input type="radio" name="tieneOS" value="0"> NO-Tiene</label>
                </div>
            </div>
        </div>
        
        
        <hr>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Paciente
        </button>
        <hr>
    </form>

<%@include file="components/bodyFinal.jsp" %>