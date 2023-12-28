<%-- 
    Document   : editarOdontologos
    Created on : 11 dic. 2023, 16:27:07
    Author     : Juanjo
--%>

<%@page import="logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-1">Editar Odontólogo </h1>
        <p class="text-gray-800">Apartado para editar un odontólogo</p>
        <hr>
    </div>

    <%
        Odontologo odonto = new Odontologo();
                
        odonto = (Odontologo) request.getSession().getAttribute("odontoEdit");
    %>

    <form class="user" action="SvEditOdontologo" method="POST">
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                    placeholder="DNI" value="<%=odonto.getDni() %>">
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre" value="<%=odonto.getNombre() %>" >
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido" value="<%=odonto.getApellido() %>" >
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=odonto.getTelefono() %>" >
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección" value="<%=odonto.getDireccion() %>" >
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                    placeholder="Fecha Nacimiento" value="<%=odonto.getFechaNacFormateada() %>" >
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control form-control-user" id="especialidad" name="especialidad"
                placeholder="Especialidad" value="<%=odonto.getEspecialidad() %>" >
        </div>
        <!-- Acá va a ir todo lo que respecta a Horarios y Usuarios-->
        
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Editar Odontólogo
        </button>
        <hr>
    </form>

<%@include file="components/bodyFinal.jsp" %>