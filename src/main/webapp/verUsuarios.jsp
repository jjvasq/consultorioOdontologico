<%-- 
    Document   : verUsuarios
    Created on : 4 dic 2023, 12:18:52
    Author     : JV7859
--%>

<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <div class="container-fluid">

        <!-- Page Heading -->
        <h4 class="text-gray-800">Ver Usuarios</h4>
        <p class="">A continuación se muestra la lista completa de usuarios.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-2">
                <div class="row">
                    <div class="col">
                        <h6 class="m-0 mt-2 font-weight-bold text-default">Usuarios</h6>
                    </div>
                    <div class="col-3">
                        <a class="btn btn-info btn-sm float-right" href="altaUsuarios.jsp">
                            <i class="fas fa-user"></i> Nuevo
                        </a>
                    </div>
                </div>    
            </div>
            
            <div class="card-body">
                <%
                    List<Usuario> listaUsuarios = (List)request.getSession().getAttribute("listaUsuarios");
                    if(listaUsuarios.isEmpty()){%>
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
                                <th>Nombre Usuario</th>
                                <th>Rol</th>
                                <th tyle="width:210px">Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Nombre Usuario</th>
                                <th>Rol</th>
                                <th style="width:210px">Acciones</th>
                            </tr>
                        </tfoot>
                        <tbody>                       
                            <%for(Usuario usua : listaUsuarios){%>
                            <tr>
                                <td>
                                    <%=usua.getIdUsuario()%>
                                </td>
                                <td><%=usua.getNombreUsuario()%></td>
                                <td><%=usua.getRol()%></td>
                                <td style="display:flex; width:230px;">
                                    <form name="editar" action="SvEditUsuario" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-primary btn-user btn-sm">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=usua.getIdUsuario()%>">
                                    </form>
                                    <form name="eliminar" action="SvElimUsuarios" method="GET"><!-- Manda el código al Servlet-->
                                        <button type="submit" class="btn btn-danger btn-user btn-sm ml-2">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=usua.getIdUsuario()%>">
                                    </form>
                                    <%if(usuarioCompleto.getRol().equalsIgnoreCase("Administrador")){ %>
                                        <form name="cambioPass" action="SvCambioPass" method="GET"><!-- Manda el código al Servlet-->
                                            <button type="submit" class="btn btn-sm btn-secondary btn-user ml-2">
                                                <i class="fas fa-key"></i>
                                            </button>
                                            <input type="hidden" name="id" value="<%=usua.getIdUsuario()%>">
                                        </form>
                                    <%}%>
                                    
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
