<%-- 
    Document   : Ver Horario
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page import="logica.Horario"%>
<%@page import="logica.Odontologo"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%
        Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontologo");
        Horario hora = (Horario)request.getSession().getAttribute("horario");
    %>

    <div class="card">
        <div class="card-header">
            <h5 class="m-0 font-weight-bold text-primary">Datos del Horario del Odontólogo: <%=odonto.getApellido() %>, <%=odonto.getNombre() %> </h5>
            <!--p class="text-gray-800">Apartado para dar de alta un nuevo odontólogo</p>
            <hr-->
        </div>
        <div class="card-body">
            
            <!--h5>Datos del Responsable</h5-->
            
            <div class="row form-group">
                <div class="col-md-6 mb-md-0 mb-sm-2 mb-xs-2">
                    <div class="card border-left-success shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-success mb-1">Hora de Inicio:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=hora.getInicio() %></div>
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
                    <div class="card border-left-danger shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-danger mb-1">Hora Fin:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=hora.getFin() %></div>
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
            
            <h5 class="mb-3 font-weight-bold text-info">Información de Contacto</h5>
            
            <div class="row form-group">
                <div class="col-12 mb-2">
                    <div class="card border-left-info shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-info mb-1">Especialidad:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=odonto.getEspecialidad() %></div>
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
                <div class="col-12 mb-2">
                    <div class="card border-left-info shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-info mb-1">Teléfono
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=odonto.getTelefono() %></div>
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
                <div class="col-12 mb-2">
                    <div class="card border-left-info shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-info mb-1">Dirección:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=odonto.getDireccion() %></div>
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
            
            <div class="row">
                <div class="col-md-6">
                    <form name="eliminar" action="SvOdontologos" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-secondary btn-block" >
                            <i class="fas fa-undo"></i> Volver a Odontólogos
                        </button>
                        <!--input type="hidden" name="id" value="<!--%=pac.getId() %>"-->
                    </form>
                </div>
                <div class="col-md-6">
                    <form name="editar" action="SvElimHorario" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-danger btn-block">
                            <i class="fas fa-trash-alt"></i> Eliminar Horario
                        </button>
                        <input type="hidden" name="idOdonto" value="<%=odonto.getId() %>">
                        <input type="hidden" name="idHorario" value="<%=hora.getIdHorario() %>">
                    </form>
                </div>
            </div>
            
        </form>
        </div>    
    </div>

<%@include file="components/bodyFinal.jsp" %>