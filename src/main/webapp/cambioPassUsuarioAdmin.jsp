<%-- 
    Document   : CambioContraseņaUsuario como Admin
    Created on : 19 dic 2023, 10:26:41
    Author     : JV7859
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%  
        Usuario usuarioCambioPass = (Usuario)request.getSession().getAttribute("usuarioCambioPass");
    %>
        
    <div class="card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-1">Cambio de Contraseņa del Usuario: <b class="text-danger"><%=usuarioCambioPass.getNombreUsuario() %></b></h1>
                <p class="text-gray-800">Apartado para el cambio de Contraseņa</p>
                <hr>
            </div>
            <form class="user" action="SvCambioPass" method="POST">
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="password" class="form-control form-control-user" id="pass" name="pass"
                            placeholder="Contraseņa">
                    </div>
                    <input type="hidden" name="id" value="<%=usuarioCambioPass.getIdUsuario() %>">
                </div>
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Cambiar Contraseņa
                </button>
                <hr>
            </form>
        </div>
    </div>

<%@include file="components/bodyFinal.jsp" %>
