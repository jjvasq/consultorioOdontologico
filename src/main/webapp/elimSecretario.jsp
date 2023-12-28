<%-- 
    Document   : Eliminar Odontólogo Intermedio
    Created on : 1 dic 2023, 14:05:57
    Author     : JV7859
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@include file="components/header.jsp" %>
<%@include file="components/bodyPrimeraParte.jsp" %>

<!--Modal Eliminación de Odontólogo-->

    <div class="card text-center border-danger mb-3" style="max-width: 30rem;">
        <div class="card-header">
            <h5 class="m-0 font-weight-bold text-danger">¿Seguro que desea Eliminar la ocurrencia?</h5> 
        </div>
        <div class="card-body">
            <h5 class="card-tittle">No podrá deshacer los cambios</h5>
            <p class="card-text">Para confirmar presione <strong>Eliminar</strong></p>
            
        </div>
        <div class="card card-footer">
            <div class="form-group row">
                <div class="col-6 mb-3 mb-md-0">
                    <a href="SvSecretarios"class="btn btn-secondary btn-block" type="button"><i class="fas fa-undo-alt"></i> Cancelar</a>
                </div>
                <div class="col-6 mb-3 mb-md-0">
                    <form name="eliminar" action="SvElimSecretario" method="POST"><!-- Manda el código al Servlet-->
                        <button type="submit" class="btn btn-danger btn-block" >
                            <i class="fas fa-trash-alt"></i> Eliminar
                        </button>
                        <input type="hidden" name="id" value="<%=request.getSession().getAttribute("idSecElim") %>">
                    </form>
                </div>
            </div>
        </div>
    </div>


<%@include file="components/bodyFinal.jsp" %>