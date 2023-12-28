<%-- 
    Document   : altaUsuarios
    Created on : 18 dic 2023, 08:50
    Author     : JV7859
--%>

<%@page import="logica.Turno"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%
        Turno tur = (Turno)request.getSession().getAttribute("turnoEdit");
        List<Paciente> listaPacientes = (List)request.getSession().getAttribute("listaPacientes");
        List<Odontologo> listaOdontologos = (List)request.getSession().getAttribute("listaOdontologos");
    %>
    

    <div class="card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-primary mb-1">Editar Turno </h1>
                <p class="text-gray-800">Formato para el horario (Ej: 8:00 - 8:30 - 15:30 ...)</p>
                <hr>
            </div>
            <form class="user" action="SvEditTurno" method="POST">
                <div class="form-group row">
                     <div class="col-lg-12 mg-lg-0">
                        <input type="date" class="form-control form-control-user" id="fechaTurno" name="fechaTurno"
                               placeholder="Fecha Turno" value="<%=tur.getFechaTurnoFormateada() %>">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="horaTurno" name="horaTurno"
                               placeholder="Hora Turno" value="<%=tur.getHoraTurno() %>">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="afeccion" name="afeccion"
                               placeholder="Afección" value="<%=tur.getAfeccion() %>">
                    </div>
                </div>
                
                <div class="row form-group mt-2">
                    <div class="col-12">
                        <div class="card border-left-danger shadow h-100">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-sm font-weight-bold text-danger mb-1">Tener en cuenta
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h6 mb-0 mt-3 mr-3 font-weight-bold text-gray-800">
                                                    <p>Para poder cambiar tanto el paciente como el Odontólgo</p>
                                                    <p>Se debe Eliminar el turno.</p>
                                                    <p>Y generar uno con el paciente y Odontólogo correcto, previamente cargados</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-exclamation-triangle fa-2x text-warning-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div> 
                    
                    
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Editar Turno
                </button>
                <hr>
            </form>
        </div>
    </div>
    

<%@include file="components/bodyFinal.jsp" %>
