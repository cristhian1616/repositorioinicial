<%@page import="modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessionOk=request.getSession();
    boolean accedio = false;
    Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
     if (sessionOk.getAttribute("usuario")!=null) {
        if (usuario.getContraseña()!=null) { accedio = true; }
     }
        
    if (accedio==false) {
    %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagenes/logo_hotel_secretos.ico">
        <title>Hotel Secretos - Principal</title>      
        <meta charset="UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>

        <link rel="stylesheet" type="text/css" href="css/sesion.css" th:href="@{/css/index.css}">

    </head>
    <body>
        <div class="modal-dialog text-center">
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img">
                        <img src="imagenes/avatar.png" th:src="@{/imagenes/avatar.png}"/>
                    </div>
                    <form action="ServletSesion" class="col-12" th:action="@{/login}" method="get" >
                        <div class="form-group" id="user-group">
                            <input type="text" name="txtCorreo" class="form-control" placeholder="Correo" name="username"/>
                        </div>
                        <div class="form-group" id="contrasena-group">
                            <input type="password" name="txtPass" class="form-control" placeholder="Contraseña" name="password"/>
                        </div>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Ingresar </button>
                        
                        <input type="hidden" name="op" value="login">
                        
                    <h6>
                        <%
                            if (request.getAttribute("msg")!=null) {
                               String msg=request.getAttribute("msg").toString();
                               %>
                               <div class="alert alert-danger" role="alert">
                                   <%=msg%>
                               </div>
                               <%
                            }
                        %>
                    </h6>
                    
                    </form>
                    <div class="col-12 forgot">
                        <p>¿No te encuentras Registrado?<p>
                            <a href="">¡Regístrate ahora!</a>
                              <p><a href="index.jsp">--INICIO--</a><p>
                    </div>                   
            </div>
                
                
        </div>
      
    </body>
</html>

<%
    }else {  
%>

<jsp:forward page="index.jsp">
    <jsp:param name="msg2" value="Usted ya se encuentra logueado"/>
</jsp:forward>

<%
    }  
%>
