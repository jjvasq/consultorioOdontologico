<%-- 
    Document   : altaUsuario de Secretario
    Created on : 14 dic 2023, 10:00
    Author     : JV7859
--%>

<%@page import="logica.Secretario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%
        Secretario sec = (Secretario)request.getSession().getAttribute("secretario");
    %>

    <div class="card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-1">Alta Usuario del Secretario: <b><%=sec.getApellido() %>, <%=sec.getNombre() %></b></h1>
                <p class="text-gray-800">Apartado para dar de alta un nuevo usuario</p>
                <hr>
            </div>
            <form class="user" action="SvSecUsuario" method="POST">
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="nombreUsuario" name="nombreUsuario"
                            placeholder="Nombre Usuario">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="password" class="form-control form-control-user" id="pass" name="pass"
                            placeholder="Contraseņa">
                    </div>
                </div>
                <div class="form-group row mx-2">
                    <label for="rol">Seleccione Rol</label>
                    <select  class="form-control" id="rol" name="rol">
                        <option value="Administrador">Administrador</option>
                        <option value="Secretario" selected>Secretario</option>
                        <option value="Profesional">Profesional</option>
                        <option value="Paciente">Paciente</option>
                        <option value="Auditor">Auditor</option>
                    </select>
                </div>
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Crear Usuario
                </button>
                <hr>
            </form>
        </div>
    </div>
    

<%@include file="components/bodyFinal.jsp" %>
