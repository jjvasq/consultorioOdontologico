<%-- 
    Document   : editarUsuarios
    Created on : 4 dic 2023, 10:26:41
    Author     : JV7859
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

    <%  
        Usuario usua = new Usuario();
        usua = (Usuario) request.getSession().getAttribute("usuarioEdit");
    %>
        
    <div class="card col-md-6">
        <div class="card-body">
            <div class="text-center">
                <h1 class="h4 text-gray-900 mb-1">Editar Usuario </h1>
                <p class="text-gray-800">Apartado para editar un usuario</p>
                <hr>
            </div>
            <form class="user" action="SvEditUsuario" method="POST">
                <div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="text" class="form-control form-control-user" id="nombreUsuario" name="nombreUsuario"
                            placeholder="Nombre Usuario" value="<%=usua.getNombreUsuario()%>">
                    </div>
                </div>
                <!--div class="form-group row">
                    <div class="col-lg-12 mb-3 mb-lg-0">
                        <input type="password" class="form-control form-control-user" id="pass" name="pass"
                            placeholder="Contraseña" value="<!--%=usu.getPass()%>">
                    </div>
                </div-->
                <div class="form-group row mx-2">
                    <label for="rol"><b>Seleccione Rol</b></label>
                    <select  class="form-control" id="rol" name="rol">
                        <!--option>Seleccione una opción</option-->
                        <option value="Administrador">Administrador</option>
                        <option value="Secretario">Secretario</option>
                        <option value="Profesional">Profesional</option>
                        <option value="Paciente">Paciente</option>
                        <option value="Auditor">Auditor</option>
                    </select>
                    
                    <input type="hidden" class="form-control form-control-user" id="id" name="id"
                    placeholder="" value="<%=usua.getIdUsuario()%>">
                    
                </div>
                <button class="btn btn-primary btn-user btn-block" type="submit">
                    Editar Usuario
                </button>
                <hr>
            </form>
        </div>
    </div>

<%@include file="components/bodyFinal.jsp" %>
