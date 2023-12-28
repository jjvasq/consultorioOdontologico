<%-- 
    Document   : Ver Turnos Paciente
    Created on : 19 dic 2023, 9:00
    Author     : JV7859
--%>

<%@page import="logica.Paciente"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>


    <div class="container-fluid">

        <%
            List<Turno> listaTurno = (List)request.getSession().getAttribute("listaTurnos");
            Paciente pac = (Paciente)request.getSession().getAttribute("paciente");
        %>
        <div class="card shadow mb-4">
            <div class="card-header py-2">
                <div class="row">
                    <div class="col">
                        <h6 class="m-0 mt-2 font-weight-bold text-secondary">Turnos del Paciente: <b class="text-success"><%=pac.getApellido() %>, <%=pac.getNombre() %></b></h6>
                    </div>
                    <div class="col-3">
                        <a class="btn btn-info btn-sm float-right" href="SvAltaTurno">
                            <i class="fas fa-clipboard"></i> Nuevo Turno
                        </a>
                    </div>
                </div>    
            </div>
                
            <div class="card-body">
                <%if(listaTurno==null || listaTurno.isEmpty()){%>
                    <div class="col mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Datos
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Actualmente no hay registros</div>
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
                <%}else{%>
                
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Odontólogo</th>
                                <th>Afección</th>
                                <th style="width:210px">Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Odontólogo</th>
                                <th>Afección</th>
                                <th style="width:210px">Acciones</th>
                            </tr>
                        </tfoot>
                       
                        <tbody>
                            
                            <%for(Turno tur : listaTurno){%>
                            <tr>          
                                <td>
                                    <%=tur.getIdTurno() %>
                                </td>
                                <td><%=tur.getFechaTurnoFormateada() %></td>
                                <td><%=tur.getHoraTurno() %></td>
                                <td><%=tur.getOdonto().getApellido() %>, <%=tur.getOdonto().getNombre() %></td>
                                <td><%=tur.getAfeccion() %></td>
                                <td style="display:flex; width:230px;">
                                    <form name="verTurno" action="SvShowTurno" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-info btn-user btn-sm mr-2" >
                                            <i class="fas fa-info-circle"></i> Detalle
                                        </button>
                                        <input type="hidden" name="id" value="<%=tur.getIdTurno() %>">
                                    </form>
                                    <form name="editar" action="SvEditTurno" method="GET">
                                        <button type="submit" class="btn btn-primary btn-user btn-sm mr-2">
                                            <i class="fas fa-pencil-alt"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=tur.getIdTurno() %>">
                                    </form>
                                    <form name="eliminar" action="SvElimTurno" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-danger btn-user btn-sm" >
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=tur.getIdTurno() %>">
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                                                        
                        </tbody>
                    </table>
                </div>
                <%} %>
            </div>
        </div>

    </div>

<%@include file="components/bodyFinal.jsp" %>