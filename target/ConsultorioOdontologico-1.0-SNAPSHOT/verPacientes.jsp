<%-- 
    Document   : verOdontologos
    Created on : 4 dic 2023, 12:18:52
    Author     : JV7859
--%>

<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->
        <h4 class="text-gray-800">Ver Pacientes</h4>
        <p class="">A continuación se muestra la lista completa de Pacientes.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-2">
                <div class="row">
                    <div class="col">
                        <h6 class="m-0 mt-2 font-weight-bold text-success">Pacientes</h6>
                    </div>
                    <div class="col-3">
                        <a class="btn btn-info btn-sm float-right" href="altaPacientes.jsp">
                            <i class="fas fa-user"></i> Nuevo
                        </a>
                    </div>
                </div>    
            </div>
                
            <div class="card-body">
                <%
                    List<Paciente> listaPaciente = (List)request.getSession().getAttribute("listaPacientes");
                    if(listaPaciente.isEmpty()){%>
                    <div class="col-md-4 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
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
                    <%}else{
                %>
                
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Fecha_Nac</th>
                                <th>TipoS</th>
                                <th>ObraSocial</th>
                                <th style="width:210px">Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Fecha_Nac</th>
                                <th>TipoS</th>
                                <th>ObraSocial</th>
                                <th style="width:210px">Acciones</th>
                            </tr>
                        </tfoot>
                        <%
                            LocalDateTime conv;
                            LocalDate dateObtenida;
                        %>
                        <tbody>
                            
                            <%for(Paciente pac : listaPaciente){%>
                            <tr>
                                <%
                                    conv = LocalDateTime.ofInstant(pac.getFechaNac().toInstant(), ZoneId.systemDefault());
                                    dateObtenida = conv.toLocalDate();
                                %>
                                
                                <td>
                                    <%=pac.getId() %>
                                </td>
                                <td><%=pac.getNombre() %></td>
                                <td><%=pac.getApellido() %></td>
                                <td><%=pac.getDni() %></td>
                                <td><%=pac.getTelefono() %></td>
                                <td><%=pac.getDireccion() %></td>
                                <td><%=dateObtenida %></td>
                                <td><%=pac.getTipoSangre() %></td>
                                <td class="text-center">
                                    <%if(pac.getTieneOS()){ %>
                                    <a href="" class="btn btn-success btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">SI</span>
                                    </a>
                                    <%}else{%>
                                    <a href="" class="btn btn-danger btn-icon-split btn-sm">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-exclamation-triangle"></i>
                                        </span>
                                        <span class="text">NO</span>
                                    </a>
                                    <%}%>
                                </td>
                                <td style="display:flex; width:230px;">
                                    
                                    <form name="editar" action="SvEditPaciente" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-primary btn-user btn-sm">
                                            <i class="fas fa-pencil-alt"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId() %>">
                                    </form>
                                    <form name="eliminar" action="SvPacTurnos" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-secondary btn-user btn-sm ml-2" >
                                            <i class="fas fa-clipboard-list"></i> Tur
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId() %>">
                                    </form>
                                    <%
                                        if(pac.getUnResponsable() == null){
                                    %>
                                        <form name="agregarResp" action="SvResponsable" method="GET"><!-- Manda el código al Servlet-->
                                            <button type="submit" class="btn btn-success btn-user btn-sm ml-2" >
                                                <i class="fas fa-user"></i> Resp <i class="fas fa-plus"></i>
                                            </button>
                                            <input type="hidden" name="id" value="<%=pac.getId() %>">
                                        </form>
                                    <%}else{%>
                                        <form name="quitarResp" action="SvShowResponsable" method="GET"><!-- Manda el código al Servlet-->
                                            <button type="submit" class="btn btn-info btn-user btn-sm ml-2" >
                                                <i class="fas fa-user"></i> Resp <i class="fas fa-info-circle"></i>
                                            </button>
                                            <input type="hidden" name="id" value="<%=pac.getId() %>">
                                        </form>
                                    <%}%>
                                    <form name="eliminar" action="SvElimPaciente" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-danger btn-user btn-sm ml-2" >
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId() %>">
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
    <!-- /.container-fluid -->

<%@include file="components/bodyFinal.jsp" %>
