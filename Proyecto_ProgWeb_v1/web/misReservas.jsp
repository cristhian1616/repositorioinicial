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
                        <h2>MIS RESERVAS </h2>
                </div> 
        </header>
                    
                
                <div class="container">
                    <div class="row" >
                        <div class="col-md-8 text-center">
                            <label for="validationCustom06" class="form-label text-center">FECHAS RESERVA </label>
                        </div>
                    </div>
                    <form  class="row text-center" action="ServletMisReservas">
                        <div class="col-md-1 text-center">
                            
                        </div>
                        <div class="col-md-3 text-center">
                            <input type="date" class="form-control" name="txtReservaDesde" id="reserva-desde"  required/>
                        </div>
                        <div class="col-md-3">
                             <input type="date" class="form-control" name="txtReservaHasta" id="reserva-hasta"  required/>
                        </div>
                        <div class="col-md-4">
                             <button class="btnAplicar" type="submit" name="op" id=""  value="aplicar">APLICAR</button>
                             <a href="ServletMisReservas?op=mostrarTodas" class="btnMostarTodas" >MOSTRAR TODAS</a>
                        </div>
                         
                    </form>
                    
                    
                    
                        <table class="table table-hover text-center">
                                 <tr>
                                 <th scope="col">Fecha Reserva</th>
                                 <th scope="col">Fecha Entrada</th>
                                 <th scope="col" >Fecha Salida</th>
                                 <th scope="col">Total</th>
                                 <th scope="col">Accion</th>
                                 </tr>
                                 <%ArrayList<Reservaciones> listReservac = (ArrayList<Reservaciones>)request.getAttribute("listaReserv");
                                 
                                 for (Reservaciones reservaciones : listReservac) {
                                      
                                 %>
                                 <tr>
                                     <td><%=reservaciones.getFechaReserva()%></td>
                                     <td><%=reservaciones.getFechaEntrada()%></td>
                                     <td><%=reservaciones.getFechaSalida()%></td>
                                     <td>S/<%=reservaciones.getTotal()%></td>
                                     <td>
                                 <form action="ServletMisReservas">
                                         <!-- Button trigger modal -->
                                <button type="button" class="btn btnDetalles" data-bs-toggle="modal" data-bs-target="#exampleModal<%=reservaciones.getId_reserva()%>">
                                Detalles
                                </button>
                                <input type="hidden"  name="txtHidenIdReserva" value="<%=reservaciones.getId_reserva()%>"/>
                                <button type="submit" class="btn btnCancelar" name="op" id=""  value="cancelarReserva" >
                                Cancelar
                                </button> 
                                
                                </form>  
                                     </td>
                                 </tr>
                                 <%
                                     }
                                 %>
                                 
                            </table>
                   
                    
                </div>
        
                  
                 <%
                     ArrayList<Reservaciones> listReservacc = (ArrayList<Reservaciones>)request.getAttribute("listaReserv");
                                 
                                 for (Reservaciones reservacion : listReservacc) {
                                     
                                    ArrayList<ReservaDetalles> listaDetalles = reservacion.getDetalles();
                                    
                                            
                                        
                                     
                                     
                  %>                
                                 
                                 
                  <div class="modal fade" id="exampleModal<%=reservacion.getId_reserva()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Detalles</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <table class="table table-hover text-center">
                                    <tr>
                                    
                                    <th scope="col">Cant.</th>
                                    <th scope="col" >Tipo</th>
                                    <th scope="col">Subtotal</th>
                                    <th scope="col">Dcto. aplicado</th>
                                    </tr>
                                    <%for (ReservaDetalles listaDetalle : listaDetalles) {
                                            
                                    %>
                                    <tr>
                                        
                                        <td><%=listaDetalle.getCantidad()%></td>
                                        <td><%=listaDetalle.getTipo()%></td>
                                        <td>S/<%=listaDetalle.getSubtotal()%></td>
                                        
                                        <%if (listaDetalle.getDctoAplicado()!=null) { %>
                                        
                                        <td><%=listaDetalle.getDctoAplicado()%></td>
                                        
                                        <%}else {%>
                                        <td>-</td>
                                        <%}%>
                                    </tr>
                                    <%}%>
                                </table>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-Success" data-bs-dismiss="modal">Aceptar</button>
                            </div>
                        </div>
                        </div>
                </div>
        
                  <%
                       }
                  %>
                  
                  
                
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