<%-- 
    Document   : editarPacientes
    Created on : 11 dic. 2023, 16:27:07
    Author     : Juanjo
--%>

<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

<!--"h1>Esto es una prueba de componentes</h1-->
    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-1">Editar Paciente </h1>
        <p class="text-gray-800">Apartado para editar un Paciente</p>
        <hr>
    </div>

    <%
        Paciente pac = new Paciente();
                
        pac = (Paciente) request.getSession().getAttribute("pacienteEdit");
    %>

    <form class="user" action="SvEditPaciente" method="POST">
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                    placeholder="DNI" value="<%=pac.getDni() %>">
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre" value="<%=pac.getNombre() %>" >
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido" value="<%=pac.getApellido() %>" >
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=pac.getTelefono() %>" >
            </div>
            <div class="col-md-4 mb-3 mb-md-0">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección" value="<%=pac.getDireccion() %>" >
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control form-control-user" id="fechaNac" name="fechaNac"
                    placeholder="Fecha Nacimiento" value="<%=pac.getFechaNacFormateada() %>" >
            </div>
        </div>
        
        <div class="form-group row mb-3">
            <div class="col-md-4 mb-3">
                <input type="text" class="form-control form-control-user" id="tipoSangre" name="tipoSangre"
                    placeholder="Tipo Sangre (Ej:0+)" value="<%=pac.getTipoSangre() %>">
            </div>
            <div class="col-md-4 ml-2">
                <label><strong>Obra Social:</strong></label>
                <div class="form-group">
                    <%
                        if(pac.getTieneOS()){
                    %>
                        <label class="radio-inline"><input type="radio" name="tieneOS" value="1" checked> Tiene</label>
                        <label class="ml-3 radio-inline"><input type="radio" name="tieneOS" value="0"> NO-Tiene</label>
                    <%}else{%>
                        <label class="radio-inline"><input type="radio" name="tieneOS" value="1"> Tiene</label>
                        <label class="ml-3 radio-inline"><input type="radio" name="tieneOS" value="0" checked> NO-Tiene</label>
                    <%}%>
                </div>
            </div>
        </div>
                
        
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Editar Paciente
        </button>
        <hr>
    </form>

<%@include file="components/bodyFinal.jsp" %>