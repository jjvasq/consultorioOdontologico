<%-- 
    Document   : verSecretarios
    Created on : 4 dic 2023, 12:18:52
    Author     : JV7859
--%>

<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="logica.Secretario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->
        <h4 class="text-gray-800">Ver Secretarios</h4>
        <p class="">A continuación se muestra la lista completa de secretarios.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-2">
                <div class="row">
                    <div class="col">
                        <h6 class="m-0 mt-2 font-weight-bold text-default">Secretarios</h6>
                    </div>
                    <div class="col-3">
                        <a class="btn btn-info btn-sm float-right" href="altaSecretarios.jsp">
                            <i class="fas fa-user"></i> Nuevo
                        </a>
                    </div>
                </div>    
            </div>
            
            <div class="card-body">
                <%
                    List<Secretario> listaSecretarios = (List)request.getSession().getAttribute("listaSecretarios");
                    if(listaSecretarios.isEmpty()){%>
                    <div class="col mb-4">
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
                                <th>Sector</th>
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
                                <th>Sector</th>
                                <th style="width:210px">Acciones</th>
                            </tr>
                        </tfoot>
                        <%
                            LocalDateTime conv;
                            LocalDate dateObtenida;
                        %>
                        <tbody>
                            
                            <%for(Secretario sec : listaSecretarios){%>
                            <tr>
                                <%
                                    conv = LocalDateTime.ofInstant(sec.getFechaNac().toInstant(), ZoneId.systemDefault());
                                    dateObtenida = conv.toLocalDate();
                                %>
                                
                                <td>
                                    <%=sec.getId() %>
                                </td>
                                <td><%=sec.getNombre() %></td>
                                <td><%=sec.getApellido() %></td>
                                <td><%=sec.getDni() %></td>
                                <td><%=sec.getTelefono() %></td>
                                <td><%=sec.getDireccion() %></td>
                                <td><%=dateObtenida %></td>
                                <td><%=sec.getSector() %></td>
                                <td style="display:flex; width:230px;">
                                    <%
                                        if(sec.getUnUsuario() == null){
                                    %>
                                        <form name="agregarUsuario" action="SvSecUsuario" method="GET"><!-- Manda el código al Servlet-->
                                            <button type="submit" class="btn btn-success btn-user btn-sm ml-2" >
                                                <i class="fas fa-user-plus"></i>
                                            </button>
                                            <input type="hidden" name="id" value="<%=sec.getId() %>">
                                        </form>
                                    <%}else{%>
                                        <form name="quitarUsuario" action="SvShowSecUsuario" method="GET"><!-- Manda el código al Servlet-->
                                            <button type="submit" class="btn btn-warning btn-user btn-sm ml-2" >
                                                <i class="fas fa-user-minus"></i> 
                                            </button>
                                            <input type="hidden" name="id" value="<%=sec.getId() %>">
                                        </form>
                                    <%}%>
                                    
                                    <form name="editar" action="SvEditSecretario" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-primary btn-user btn-sm ml-2">
                                            <i class="fas fa-pen-alt"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=sec.getId() %>">
                                    </form>
                                   
                                    <form name="eliminar" action="SvElimSecretario" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-danger btn-user btn-sm ml-2" >
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <input type="hidden" name="id" value="<%=sec.getId() %>">
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
