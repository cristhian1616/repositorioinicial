<%@page import="modelo.ReservaDetalles"%>
<%@page import="modelo.Reservaciones"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.Usuarios"%>
<%@page import="modelo.Cesta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<% 
    String nombres="";
    boolean accedio=false;
    Usuarios usuario=null;
    int numeroMesActual= LocalDateTime.now().getMonthValue();
    String mesActual; 
    if (numeroMesActual<10) { mesActual= "0"+numeroMesActual;  }
    else { mesActual= ""+numeroMesActual;}
    
    String fechaHoy= LocalDateTime.now().getYear()+"-"+mesActual+"-"+LocalDateTime.now().getDayOfMonth();
    
    HttpSession sessionOk=request.getSession();
    HttpSession sesion=request.getSession();
    if (sessionOk.getAttribute("usuario")!=null) {
        
        usuario = (Usuarios)sessionOk.getAttribute("usuario");
        if (usuario.getContraseña()!=null) {   accedio=true;   }
        
    }
        
       
    if (accedio==true) {
            
        
%>

<html>
    
    <head>
        <title>Hotel Secretos - Mis Reservas</title>
        <link rel="shortcut icon" href="imagenes/logo_hotel_secretos.ico">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="css/index.css" rel="stylesheet">
        <link href="css/misReservas.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        
    </head>
    
    <body>
        
       <%@include file='WEB-INF/jspf/header.jspf' %>
                
                <div class="nombreHotel">
                        <h2>MI PERFIL </h2>
                </div> 
        </header>
                    
                
                <div class="container">
                    
                    
                    <div class="row">
                        <div class="col-md-6 text-white text-center bg-black">
                            <%if(usuario.getTipo_usuario().equals("Cliente")){%>
                             <h6>Cliente</h6>
                             <%}else{%>
                             <h6>Administrador</h6>
                             <%}%>
                        
                        <img src="imagenes/avatar_perfil_hombre.jpg" alt="alt" width="220px"/>
                      
                    </div>
                        <div class="col-md-6">
                        
                            <form action="ServletMiPerfil">
                                
                                <table class="table table-hover">
                                    
                                        
                                    
                                    <tr>
                                        <th scope="col" colspan="2">Datos Personales</th>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                           <h6>DNI</h6> 
                                        </td>
                                        <td>
                                            <input type="text" name="txtDni" class="form-control bg-white"<%if (sessionOk.getAttribute("usuario")!=null) { %>
                                            value="<%=usuario.getCodUsu()%>" 
                                            <% } %> disabled="true" required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           <h6>Apellidos</h6> 
                                        </td>
                                        <td>
                                            <input type="text" name="txtApellidos" class="form-control "<%if (sessionOk.getAttribute("usuario")!=null) { %>
                                            value="<%=usuario.getApellidos()%>" 
                                            <% } %> required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           <h6>Nombres</h6> 
                                        </td>
                                        <td>
                                            <input type="text" name="txtNombres" class="form-control "<%if (sessionOk.getAttribute("usuario")!=null) { %>
                                            value="<%=usuario.getNombres()%>" 
                                            <% } %> required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">
                                            
                                            <button type="submit" class="btn btnCancelar" name="op" id=""  value="actualizaDatosPersonales" >
                                                Actualizar
                                            </button>
                                            
                                        </td> 
                                        
                                    </tr>
                                   
                                </table>
                                
                            </form>
                            
                        
                        </div>
                                                
                        <div class="col-md-6">
                        <br>  
                            <form action="ServletMiPerfil">
                                
                                <table class="table table-hover">
                                    <tr>
                                        <th colspan="2">Contacto</th>
                                    </tr>
                                    <tr>
                                        <td>
                                           <h6>Telefono</h6> 
                                        </td>
                                        <td>
                                            <input type="number" name="txtTelefono" class="form-control "<%if (sessionOk.getAttribute("usuario")!=null) { %>
                                            value="<%=usuario.getTelefono()%>" 
                                            <% } %> required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           <h6>Correo</h6> 
                                        </td>
                                        <td>
                                            <input type="email" name="txtCorreo" class="form-control "<%if (sessionOk.getAttribute("usuario")!=null) { %>
                                            value="<%=usuario.getCorreo()%>" 
                                            <% } %> required="true"/>
                                        </td>
                                    </tr>
                                    
                                        <tr>
                                        
                                        <td colspan="2" align="right">
                                            
                                            <button type="submit" class="btn btnCancelar" name="op" id=""  value="actualizarContacto" >
                                                Actualizar
                                            </button>
                                        </td> 
                                        </tr>
                                    
                                    
                                   
                                </table>
                                
                            </form>
                            
                        
                        </div>
                                        
                        <div class="col-md-6">
                        
                            <form action="ServletMiPerfil">
                                
                                <table class="table table-hover ">
                                    <br>  
                                    <tr>
                                        <th colspan="2">Sesion</th>
                                    </tr>
                                    <tr>
                                        <td>
                                           <h6>Contraseña Actual</h6> 
                                        </td>
                                        <td>
                                            <input type="password" name="txtContraActual" class="form-control " required="true"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                           <h6>Contraseña Nueva</h6> 
                                        </td>
                                        <td>
                                            <input type="password" name="txtContraNueva" class="form-control " required="true"/>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="2" align="right">
                                            <button type="submit" class="btn btnCancelar" name="op" id=""  value="actualizarSesion" >
                                                Actualizar
                                            </button>
                                        </td> 
                                    </tr>
                                   
                                </table>
                                
                            </form>
                            
                        
                        </div>
                        
                        
                        
                    </div>
                    
                            <% if (sesion.getAttribute("mensajeMiPerfil")!=null) { %>
                                    <div class="col-12 alert alert-danger text-center" role="alert">
                                        <%=sesion.getAttribute("mensajeMiPerfil")%>
                                    </div>
                                <% sesion.setAttribute("mensajeMiPerfil", null); } %>
                    
                  
                </div>
                
                 <footer class="bg-black text-white">
                    
                    <div class="container text-center">
                        <h6>Dirección:  Av. La Rosa Lozano y Tirado 1268, Prolongación San Ignacio Lima 01 - Santiago de Surco, Peru</h6>
                        <h6>Telefono: (01) 275-08-98</h6>
                        <h6>Copyrights © 2022 - Derechos Reservados</h6>
                    </div>
                    
                        
                    
                </footer>
                       
                                        
                                        
                <script>
                    var myModal = document.getElementById('myModal')
                    var myInput = document.getElementById('myInput')

                    myModal.addEventListener('shown.bs.modal', function () {
                    myInput.focus()
                    })
                </script>
        
    </body>
</html>

<% } else { %>

<jsp:forward page="index.jsp">
    <jsp:param name="msg2" value="Cliente no logueado"/>
</jsp:forward>

<% } %>