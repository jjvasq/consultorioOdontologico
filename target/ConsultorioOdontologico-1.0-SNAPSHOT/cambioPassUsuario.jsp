<%-- 
    Document   : CambioContraseñaUsuario
    Created on : 14 dic 2023, 10:26:41
    Author     : JV7859
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%  
        
    %>
        
    <div class="card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-1">Cambio de Contraseña Usuario </h1>
                <p class="text-gray-800">Apartado para el cambio de Contraseña</p>
                <hr>
            </div>
            <form class="user" action="SvCambioPassUsuario" method="POST">
                <!--div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="nombreUsuario" name="nombreUsuario"
                            placeholder="Nombre Usuario" value="<!--%=usu.getNombreUsuario()%>">
                    </div>
                </div-->
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="password" class="form-control form-control-user" id="pass" name="pass"
                            placeholder="Contraseña">
                    </div>
                </div>
                
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Cambiar Contraseña
                </button>
                <hr>
            </form>
        </div>
    </div>

<%@include file="components/bodyFinal.jsp" %>
