<%-- 
    Document   : Ver Responsable
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="logica.Responsable"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

<!--"h1>Esto es una prueba de componentes</h1-->
    <%
        Paciente pac = (Paciente)request.getSession().getAttribute("paciente");
        Responsable resp = (Responsable)request.getSession().getAttribute("responsable");
        LocalDateTime conv = LocalDateTime.ofInstant(resp.getFechaNac().toInstant(), ZoneId.systemDefault());;
        LocalDate dateObtenida = conv.toLocalDate();;
    %>

    <div class="card">
        <div class="card-header">
            <h5 class="m-0 font-weight-bold text-primary">Datos del Responsable del Paciente: <%=pac.getApellido() %>, <%=pac.getNombre() %> </h5>
            <!--p class="text-gray-800">Apartado para dar de alta un nuevo odontólogo</p>
            <hr-->
        </div>
        <div class="card-body">
            
            <!--h5>Datos del Responsable</h5-->
            
            <div class="row form-group">
            
                <div class="col-md-6 mb-md-0 mb-sm-2 mb-xs-2">
                    <div class="card border-left-info shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-info mb-1">Apellido y Nombre:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=resp.getApellido() %>, <%=resp.getNombre() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
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
                                    <div class="text-sm font-weight-bold text-info mb-1">DNI:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=resp.getDni() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        
            <div class="row form-group">
                                        
                <div class="col-md-6">
                    <div class="card border-left-success shadow h-100 ">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-success mb-1">Dirección:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=resp.getDireccion() %>, <%=resp.getNombre() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
                      
                <div class="col-md-6">
                    <div class="card border-left-success shadow h-100 ">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-success mb-1">Tipo Responsable
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=resp.getTipoResponsable() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                        
            </div>
            
            <div class="row form-group">
                                        
                <div class="col-md-6">
                    <div class="card border-left-primary shadow h-100 ">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-primary mb-1">Teléfono:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=resp.getTelefono() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
                      
                <div class="col-md-6">
                    <div class="card border-left-primary shadow h-100 ">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-primary mb-1">Fecha Nacimiento
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=dateObtenida %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                        
            </div>
            
            
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <form name="eliminar" action="SvPacientes" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-secondary btn-block" >
                            <i class="fas fa-undo"></i> Volver a Pacientes
                        </button>
                        <!--input type="hidden" name="id" value="<!--%=pac.getId() %>"-->
                    </form>
                </div>
                <div class="col-md-6">
                    <form name="editar" action="SvElimResponsable" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-danger btn-block">
                            <i class="fas fa-trash-alt"></i> Eliminar Responsable
                        </button>
                        <input type="hidden" name="idPaciente" value="<%=pac.getId() %>">
                        <input type="hidden" name="idResponsable" value="<%=resp.getId() %>">
                    </form>
                </div>
            </div>
            
        </form>
        </div>    
    </div>

<%@include file="components/bodyFinal.jsp" %>