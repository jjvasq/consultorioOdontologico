<%-- 
    Document   : Ver Turno
    Created on : 17 dic 2023, 21:10
    Author     : JV7859
--%>

<%@page import="logica.Turno"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

<!--"h1>Esto es una prueba de componentes</h1-->
    <%
        Paciente pac = (Paciente)request.getSession().getAttribute("paciente");
        Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontologo");
        Turno tur = (Turno)request.getSession().getAttribute("turno");
    %>

    <div class="card">
        <div class="card-header">
            <h5 class="m-0 font-weight-bold text-primary">Datos del Turno: <%=tur.getFechaTurnoFormateada() %> </h5>
            <!--p class="text-gray-800">Apartado para dar de alta un nuevo odontólogo</p>
            <hr-->
        </div>
        <div class="card-body">
            
            <div class="row form-group">
            
                <div class="col-md-6 mb-md-0 mb-sm-2 mb-xs-2">
                    <div class="card border-left-info shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-info mb-1">Hora del Turno:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=tur.getHoraTurno() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clock fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card border-left-info shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-info mb-1">Afección:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=tur.getAfeccion() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-virus fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                   
                                        
            <div class="row form-group mt-2">
                <div class="col-6">
                    <div class="card border-left-primary shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-primary mb-1">Datos del Paciente
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mt-3 mr-3 font-weight-bold text-gray-800">
                                                <p>Nombre y Apellido: <%=pac.getNombre() %>, <%=pac.getApellido() %></p>
                                                <p>DNI: <%=pac.getDni() %> </p>
                                                <p>Fecha de Nacimiento: <%=pac.getFechaNacFormateada() %></p>
                                                <p>Dirección: <%=pac.getDireccion() %> </p>
                                                <p>Telefono: <%=pac.getTelefono() %> </p>
                                                <p>Grupo y Factor Sanguíneo: <%=pac.getTipoSangre() %> </p>
                                                <p>Obra Social: <%if(pac.getTieneOS()){ %> <i class="fas fa-check text-success"></i> Tiene <%}else{%><i class="fas fa-ban text-danger"></i> No tiene<%}%> </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-user fa-2x text-warning-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card border-left-success shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-success mb-1">Datos del Odontólogo
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mt-3 mr-3 font-weight-bold text-gray-800">
                                                <p>Nombre y Apellido: <%=odonto.getNombre() %>, <%=odonto.getApellido() %></p>
                                                <p>DNI: <%=odonto.getDni() %> </p>
                                                <p>Dirección: <%=odonto.getDireccion() %> </p>
                                                <p>Telefono: <%=odonto.getTelefono() %> </p>
                                                <p>Especialidad: <b class="text-success"> <%=odonto.getEspecialidad() %></b> </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-user-tie fa-2x text-success"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                            
                                        
         
            
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <form name="eliminar" action="SvTurnos" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-secondary btn-block" >
                            <i class="fas fa-undo"></i> Volver a Turnos
                        </button>
                        <!--input type="hidden" name="id" value="<!--%=pac.getId() %>"-->
                    </form>
                </div>
                <div class="col-md-6">
                    <form name="editar" action="SvEditTurno" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-primary btn-block">
                            <i class="fas fa-pen-alt"></i> Editar Turno
                        </button>
                        <input type="hidden" name="id" value="<%=tur.getIdTurno() %>">
                    </form>
                </div>
            </div>
            
        </form>
        </div>    
    </div>

<%@include file="components/bodyFinal.jsp" %>