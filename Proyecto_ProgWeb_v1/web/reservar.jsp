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
        if (usuario.getContraseña()!=null) {
                accedio=true;
            }
        
    }
        
       

%>

<html>
    
    <head>
        <title>Hotel Secretos - Reservar</title>
        <link rel="shortcut icon" href="imagenes/logo_hotel_secretos.ico">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="css/index.css" rel="stylesheet">
        <link href="css/reservar.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        
    </head>
    
    <body>
        
           <%@include file='WEB-INF/jspf/header.jspf' %>
                
                <div class="nombreHotel">
                        <h2>RESERVAR </h2>
                </div> 
                 
            </header>
        
        
        
        
            <div class="container">
                <section class="main">
                    <div class="row">
                        <article class="col-md-6">
                             <% if (sesion.getAttribute("msgCamposVacios")!=null) { %>
                               
                               <div class="col-12 alert alert-danger text-center" role="alert">
                                   <%=sesion.getAttribute("msgCamposVacios")%>
                               </div>
                               
                               <% }  %>
                            
                               <form class="row g-3 needs-validation" action="ServletReservar" novalidate>
                    <div class="col-md-4">
                      <label for="validationCustom01" class="form-label">DNI</label>
                      <input type="number" class="form-control" name="txtDni" id="dni" required min="0" max="99999999"
                      <%if (sessionOk.getAttribute("usuario")!=null) { %>
                             value="<%=usuario.getCodUsu()%>" 
                              <%if (accedio==true) { %>  disabled="true" <% }%>
                      <% } %>
                                            >
                    </div>
                  
                    <div class="col-md-4">
                      <label for="validationCustom02" class="form-label" id="apell">APELLIDOS</label>
                      <input type="text" class="form-control apellidos" name="txtApellidos" id="apellidos" required 
                      <%if (sessionOk.getAttribute("usuario")!=null) { %>
                             value="<%=usuario.getApellidos()%>" 
                            <%if (accedio==true) { %>  disabled="true" <% }%>
                      <% } %>
                                            >
                    </div>
                  
                    <div class="col-md-4">
                        <label for="validationCustom03" class="form-label" id="nomb">NOMBRES</label>
                        <input type="text" class="form-control" name="txtNombres" id="nombres" required
                        <%if (sessionOk.getAttribute("usuario")!=null) { %>
                             value="<%=usuario.getNombres()%>" 
                              <%if (accedio==true) { %>  disabled="true" <% }%>
                      <% } %>
                                            >
                    </div>
                  
                    <div class="col-md-4">
                      <label for="validationCustom04" class="form-label">TELEFONO</label>
                      <input type="number" class="form-control" name="txtTelefono" id="telefono" required min="0" max="999999999"
                      <%if (sessionOk.getAttribute("usuario")!=null) { %>
                             value="<%=usuario.getTelefono()%>" 
                             <%if (accedio==true) { %>  disabled="true" <% }%>
                      <% } %>
                                            >
                    </div>
                  
                    <div class="col-md-8">
                      <label for="validationCustom05" class="form-label">CORREO</label>
                      <input type="email" class="form-control" name="txtCorreo" id="correo" required
                      <%if (sessionOk.getAttribute("usuario")!=null) { %>
                             value="<%=usuario.getCorreo()%>" 
                              <%if (accedio==true) { %>  disabled="true" <% }%>
                      <% } %>
                                            >
                    </div>
                  
                    <div class="col-md-4">
                      <label for="validationCustom06" class="form-label">FECHA ENTRADA </label>
                      <input type="date" class="form-control" name="txtFEntrada" id="fecha-entrada"  required min="<%=fechaHoy%>"
                      <%if (sesion.getAttribute("fecha_entrada")!=null) { %>
                             value="<%=sesion.getAttribute("fecha_entrada")%>" 
                             disabled="true"
                      <% } %>   
                                            >
                    </div>
                   
                    <div class="col-md-4">
                        <label for="validationCustom07" class="form-label">FECHA SALIDA </label>
                        <input type="date" class="form-control" name="txtFSalida" id="fecha-salida" disabled="true" required min="<%=fechaHoy%>"
                        <%if (sesion.getAttribute("fecha_salida")!=null) { %>
                             value="<%=sesion.getAttribute("fecha_salida")%>" 
                             disabled="true"
                      <% } %>   
                                            >

                    </div>
                  
                    <div class="col-md-4">
                      <label for="validationCustom08" class="form-label">DIA</label>
                      <%if ((String)sesion.getAttribute("dia")!=null) { %> 
                      <input type="text" class="form-control" name="txtDia" id="dia" required value="<%=sesion.getAttribute("dia")%>" disabled="true"/>
                           <% }else {%> 
                      <select class="form-select" name="txtDia" id="dia" required>
                        <option selected disabled value="">Selecciona</option>
                        <option id="opc01">Dia entero</option>
                        <option id="opc02">Medio dia/noche</option>
                      </select>
                      
                      <% }%> 
                      
                    </div>
                  
                  
                  
                  
                    <div class="col-12 text-center">
                        <%if ((Long)sesion.getAttribute("diasHospedaje")!=null) { %> 
                        <label><b>HOSPEDAJE: <%=sesion.getAttribute("diasHospedaje")%> día(s)  &nbsp;|&nbsp; </b></label>
                        <%}%>
                        
                        <%if ((Double)sesion.getAttribute("total")!=null) { %> 
                         <label><b>TOTAL: S/ <%=sesion.getAttribute("total")%></b></label>
                        <%}%>
                    </div>
                    
                    
                    <div class="col-12 text-center">
                        <a href="ServletReservar?op=cancelar" class="cancelar"><span class="material-symbols-outlined">cancel</span>CANCELAR</a>
                                </div>
                  
                   <div class="d-grid gap-2 col-12 mx-auto">
                    
                   
                   
                    <%if (accedio==false) { %> 
                     <button class="botnReservar" type="submit" name="op" id="btnReservarSubmit"  value="reservar">RESERVAR</button>
                    <% }else {%>
                      <a href="ServletReservar?op=reservar" class="botnReservar" id="btnReservarNoSubmit">RESERVAR</a>
                    <% } %>
                      
                    
                  </div>
            </form>
                            
                            
                            
                            
                        </article>
                        <article class="col-md-6">
                            
                            <form action="ServletReservar" class="row needs-validation" novalidate>
                                
                                <input type="hidden" name="txthDni" id="txthDni"/>
                                <input type="hidden" name="txthApellidos" id="txthApellidos"/>
                                <input type="hidden" name="txthNombres" id="txthNombres"/>
                                <input type="hidden" name="txthTelefono" id="txthTelefono"/>
                                <input type="hidden" name="txthCorreo" id="txthCorreo"/>
                                <input type="hidden" name="txthFEnt" id="txthFEnt"/>
                                <input type="hidden" name="txthFSal" id="txthFSal"/>
                                <input type="hidden" name="txthdia" id="txthdia"/>
                                
                                <div class="col-md-6">
                                    <label for="validationCustom09" class="form-label">TIPO HABITACION</label>
                                    <select class="form-select" name="txtNombreHab" id="validationCustom04" required>
                                      <option selected disabled value="">Selecciona</option>
                                      <option>HABITACION MATRIMONIAL</option>
                                      <option>HABITACION SIMPLE</option>
                                      <option>HABITACION STANDAR</option>
                                      <option>HABITACION MATRIM. DOBLE</option>
                                      <option>HABITACION SIMPLE DOBLE</option>
                                      <option>HABITACION STANDAR DOBLE</option>
                                    </select>
                                </div>

                                <div class="col-md-2">
                                  <label for="validationCustom10" class="form-label">CANT.</label>
                                  <input type="number" class="form-control" name="txtCantidad" id="cantidad" required min="1" max="99">
                                </div>

                                <div class="accion d-grid gap-1 col-1 mx-auto">
                                <label for="validationCustom11" class="form-label"></label>
                                  <input type="hidden" id="" >
                                  <button class="" type="submit" name="op" id="btn_agregar" value="agregar" title="Agregar"><span class="material-symbols-outlined">add_circle</span></button>
                                  
                                </div>
                                
                                <div class="accion d-grid gap-1 col-1 mx-auto">
                                <label for="validationCustom12" class="form-label"></label>
                                  <input type="hidden" id="" >
                                  <button class="" type="submit" name="op" id="btn_editar" value="editar" title="Editar"><span class="material-symbols-outlined">edit</span></button>
                                </div>
                                
                                <div class="accion d-grid gap-1 col-1 mx-auto">
                                <label for="validationCustom13" class="form-label"></label>
                                  <button class="" type="submit" name="op" id="btn_eliminar" value="eliminar" title="Eliminar"><span class="material-symbols-outlined">delete</span></button>
                                </div>
                                
                            </form>
                            
                            <table class="table table-hover text-center">
                                 <tr>
                                 <th scope="col">CODIGO</th>
                                 <th scope="col">CANT.</th>
                                 <th scope="col" >TIPO</th>
                                 <th scope="col">SUBTOTAL*</th>
                                 </tr>
                                 <%
                                  ArrayList<Cesta> lista = (ArrayList<Cesta>)sesion.getAttribute("reserva");
                                  if (lista!=null) {
                                          for (Cesta cesta : lista) {        
                                 %>
                                      
                                      
                                 <tr>
                                     <td><%=cesta.getCodigo().toLowerCase()%></td>
                                     <td><%=cesta.getCantidad()%></td>
                                     <td><%=cesta.getNombreHab().toLowerCase()%></td>
                                     <td>S/ <%=cesta.getSubtotal()%></td>
                                 </tr>
                                 
                                 
                                 <%
                                      }
                                   }
                                 %>
                                 
                                 
                                 
                            </table>
                            
                            
                        </article>
                    </div>
                    
                </section>
                
                                <% if (sesion.getAttribute("id_reserva")!=null) { %>
                                    
                                    <div class="col-12 alert alert-danger text-center" role="alert">
                                    Reserva efectuada satisfactoriamente
                                    </div>
                                    
                                <% sesion.setAttribute("id_reserva", null); } %>
                                
                                
                                <% if (sesion.getAttribute("mensajeError")!=null) { %>
                                <%if(usuario.getTipo_usuario().equals("Cliente")){%>
                                    <div class="col-12 alert alert-danger text-center" role="alert">
                                        <%=sesion.getAttribute("mensajeError")%>
                                    </div>
                                <%}else{%>
                                    <div class="col-12 alert alert-danger text-center" role="alert">
                                        Como administrador no puede realizar reserviones, es solo una prueba para usted
                                    </div>
                                <%}%>
                                    
                                <% sesion.setAttribute("mensajeError", null); } %>
                
            </div>
        
        
                 <div class="container " >
               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Referencia* <br>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;días de hospedaje y dcto aplicados<br>
               </p>
                       
            </div>
        
                
                 <footer class="bg-black text-white">
                    
                    <div class="container text-center">
                        <h6>Dirección:  Av. La Rosa Lozano y Tirado 1268, Prolongación San Ignacio Lima 01 - Santiago de Surco, Peru</h6>
                        <h6>Telefono: (01) 275-08-98</h6>
                        <h6>Copyrights © 2022 - Derechos Reservados</h6>
                    </div>
                    
                        
                    
                </footer>
        
                                 
          
         <script>
             //mi script
             var dni = document.querySelector('input[id="dni"]');
             var apellidos = document.querySelector('input[id="apellidos"]');
             var nombres = document.querySelector('input[id="nombres"]');
             var telefono = document.querySelector('input[id="telefono"]');
             var correo = document.querySelector('input[id="correo"]');
             
             //
            var fechaSalida = document.querySelector('input[id="fecha-salida"]');
            var fechaEntrada = document.querySelector('input[id="fecha-entrada"]');
            fechaEntrada.addEventListener("click",actFE);
            function actFE() {
                    fechaSalida.value =fechaEntrada.value;
                    fechaSalida.disabled=false;
}
            fechaSalida.addEventListener("click", actFS);
             function actFS() {
                  
                   fechaSalida.min = fechaEntrada.value;
                   fechaEntrada.disabled=true;
                  }
                  
             //
             var dia = document.getElementById('dia');
             dia.addEventListener("click", actDia);
             function actDia() {
                 fechaSalida.disabled=true;
                 if (fechaEntrada.value == fechaSalida.value) {
                     var opc2 = document.getElementById('opc02');
                     opc2.disabled=false;
                  }else if(fechaEntrada.value > fechaSalida.value){
                      fechaSalida.value =fechaEntrada.value;
                      opc2.disabled=true;
                  } else {
                      var opc2 = document.getElementById('opc02');
                      opc2.disabled=true;
                 }
                 
                  }
                  
             //
             var btn_agregar = document.getElementById('btn_agregar');
             var btn_editar = document.getElementById('btn_editar');
             var btn_eliminar = document.getElementById('btn_eliminar');
             btn_agregar.addEventListener("click", recuperardata);
             btn_editar.addEventListener("click", recuperardata);
             btn_eliminar.addEventListener("click", recuperardata);
             function recuperardata(){
                 var hidenDni = document.getElementById('txthDni');
                 var hidenApellidos = document.getElementById('txthApellidos');
                 var hidenNombres = document.getElementById('txthNombres');
                 var hidenTelefono = document.getElementById('txthTelefono');
                 var hidenCorreo = document.getElementById('txthCorreo');
                 var hidenFE = document.getElementById('txthFEnt');
                 var hidenFS = document.getElementById('txthFSal');
                 var hidenDia = document.getElementById('txthdia');
                 hidenDni.value = dni.value;
                 hidenApellidos.value = apellidos.value;
                 hidenNombres.value = nombres.value;
                 hidenTelefono.value= telefono.value;
                 hidenCorreo.value = correo.value;
                 hidenFE.value =fechaEntrada.value;
                 hidenFS.value = fechaSalida.value;
                 hidenDia.value = dia.value;
             }
             
             
             
                  
             //
            var cant = document.getElementById('cantidad');
            cant.addEventListener("keyup", maxCant)
            function maxCant() {
                 if (cant.value.length > 2) { cant.value=cant.value.slice(0,2);   }
                 if (cant.value<0) { cant.value=1;}
                 else if (cant.value==0) { cant.value="";}
                }
                
             
            var dni = document.getElementById('dni');
            dni.addEventListener("keyup", maxDni)
            function maxDni() {
                 if (dni.value.length > 8) { dni.value=dni.value.slice(0,8);   }
                 if (dni.value<0) { dni.value=0;}
                }
                
             
           var telefono = document.getElementById('telefono');
           telefono.addEventListener("keyup", maxTelefono)
           function maxTelefono() {
                 if (telefono.value.length > 9) { telefono.value=telefono.value.slice(0,9);   }
                 if (telefono.value<0) { telefono.value=0;}
                }
               
             
        </script>
        <script>
                  (function () {
                  'use strict'
                  
                  // Fetch all the forms we want to apply custom Bootstrap validation styles to
                  var forms = document.querySelectorAll('.needs-validation')

                  // Loop over them and prevent submission
                  Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                      form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                          event.preventDefault()
                          event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                      }, false)
                    })
                })()
        </script>
    </body>
</html>