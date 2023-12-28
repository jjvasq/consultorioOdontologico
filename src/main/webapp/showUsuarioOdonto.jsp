<%-- 
    Document   : Ver Usuario del Odontologo
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page import="logica.Usuario"%>
<%@page import="logica.Odontologo"%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%
        Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontologo");
        Usuario usua = (Usuario)request.getSession().getAttribute("usuario");
    %>

    <div class="card">
        <div class="card-header">
            <h5 class="m-0 font-weight-bold text-default">Datos del Usuario del Odontólogo: <%=odonto.getApellido() %>, <%=odonto.getNombre() %> </h5>
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
                                    <div class="text-sm font-weight-bold text-success mb-1">Nombre Usuario:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=usua.getNombreUsuario() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-user fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card border-left-warning shadow h-100">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-sm font-weight-bold text-warning mb-1">Rol:
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h6 mb-0 mr-3 font-weight-bold text-gray-800"><%=usua.getRol() %></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-user-tie fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        
            <hr>
            
            <h5 class="m-0 font-weight-bold text-danger">Información Importante</h5>
            
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
                                                <p>El siguiente enlace permite la mofidicación de los datos del Usuario.</p>
                                                <p>No se permite modificar la contraseña.</p>
                                                <p>Para poder modificar la contraseña, el usuario debe estar logueado.</p>
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
                    <form name="editar" action="SvEditUsuario" method="GET"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-primary btn-block">
                            <i class="fas fa-pen-alt"></i> Modificar Usuario
                        </button>
                        <input type="hidden" name="id" value="<%=usua.getIdUsuario() %>">
                        
                    </form>
                </div>
            </div>
            
        </form>
        </div>    
    </div>

<%@include file="components/bodyFinal.jsp" %>