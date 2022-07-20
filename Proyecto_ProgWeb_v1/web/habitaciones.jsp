<%@page import="java.time.LocalDateTime"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.Usuarios"%>
<%@page import="modelo.Habitacion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    
    if (sessionOk.getAttribute("usuario")!=null) {
        
        usuario = (Usuarios)sessionOk.getAttribute("usuario");
        if (usuario.getContraseña()!=null) {
                accedio=true;
            }
        
    }
        
       

%>
<html>
    <head>
        <title>Hotel Secretos - Habitaciones</title>
        <link rel="shortcut icon" href="imagenes/logo_hotel_secretos.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="css/index.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    </head>
    
    <body>
        
            <%@include file='WEB-INF/jspf/header.jspf' %>
                
                <div class="nombreHotel">
                        <h2>HABITACIONES </h2>
                        
                </div> 
  
            </header>
        
        
        <%
         ArrayList<Habitacion> listaHab = (ArrayList<Habitacion>)request.getAttribute("listaHab");
         
                   
          
                    int i=0, tamaño=listaHab.size();
                    int CF=(tamaño)/3;
                    int CCF=(tamaño)%3;
                   
                    for (int j=0; j<CF;j++) {
                            
                           
                            
        
        %>
        
         
        <div class="container">
            <div class="row informacion text-center">
                <%
                    
                if(j+1<CF){
                    for(int k=0; k<3; k++){
                    Habitacion hab=listaHab.get(i);
                    ArrayList desc_esp= hab.getDesc_espec();
                    
                    i++;
                   
                 %>
                 <div class="col-12 col-lg-4">
                        <div class="alert alert card card">
                            <img src="imagenes/<%=hab.getCodigo()%>.jpg" class="card-img-top" alt="..."/>
                            <div class="card-body">
                              <h5 class="card-title" align="center"><%=hab.getNombre()%></h5>
                              <p class="card-text"><%=hab.getDesc_gen()%></p>
                            </div>
                            <form action="ServletReservar?op=agregar">
                                <input type="hidden" name="txthDni" id="txthDni" />
                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="<%=hab.getNombre()%>"/>
                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                 ¡RESERVAR AHORA!
                                </button>
                            </form>
                            
                            <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                               <h2 class="accordion-header" id="flush-headingOne">
                                   <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%=i%>" aria-expanded="false" aria-controls="flush-collapseOne">
                                        <p>Detalles </p>
                                    </button>
                               </h2>
                               <div id="flush-collapse<%=i%>" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                   <div class="accordion-body">
                                       <ul class="list-group list-group-flush">
                                           <li class="list-group-item">S/<%=hab.getPrecio()%> día entero</li>
                                            <%for(int l=0;l<desc_esp.size();l++){%>
                                           <li class="list-group-item"><%=desc_esp.get(l)%></li>
                                           <%}%>
                                           
                                      </ul>
                                   </div>
                               </div>
                            </div>
                            </div>
                        </div>
                    </div>
                <%
                    } }else if(j+1==CF){
                         for(int k=0; k<=CCF+2; k++){
                    Habitacion hab=listaHab.get(i);
                    ArrayList desc_esp= hab.getDesc_espec();
                    i++;
                    
                %>
                <div class="col-12 col-lg-4">
                        <div class="alert alert card card">
                            <img src="imagenes/<%=hab.getCodigo()%>.jpg" class="card-img-top" alt="..."/>
                            <div class="card-body">
                              <h5 class="card-title" align="center"><%=hab.getNombre()%></h5>
                              <p class="card-text"><%=hab.getDesc_gen()%></p>
                            </div>
                            <form action="ServletReservar?op=agregar">
                                <input type="hidden" name="txthDni" id="txthDni" />
                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="<%=hab.getNombre()%>"/>
                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                 ¡RESERVAR AHORA!
                                </button>
                            </form>
                            
                            <div class="accordion" id="accordionPanelsStayOpenExample">
                            <div class="accordion-item">
                               <h2 class="accordion-header" id="flush-headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse<%=i%>" aria-expanded="false" aria-controls="flush-collapseOne">
                                        <p>Detalles</p>
                                    </button>
                               </h2>
                               <div id="flush-collapse<%=i%>" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                   <div class="accordion-body">
                                       <ul class="list-group list-group-flush">
                                           <li class="list-group-item">S/<%=hab.getPrecio()%>  día entero</li>
                                            <%for(int l=0;l<desc_esp.size();l++){%>
                                           <li class="list-group-item"><%=desc_esp.get(l)%></li>
                                           <%}%>
                                           
                                      </ul>
                                   </div>
                               </div>
                            </div>
                            </div>
                        </div>
                    </div>
                 
                 <%
                     } 
                     }
                  %>
            </div>
        </div>
        
        <%
            }
        %>
        
        
        
        
        
        
        
        
        
        <br>
        
           <div class="container " >
               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Referencia* <br>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;medio día/noche: 12 horas<br>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;día entero: 24 horas
               </p>
                       
            </div>
         
          <footer class="bg-black text-white">
                    
                    <div class="container text-center">
                        <h6>Dirección:  Av. La Rosa Lozano y Tirado 1268, Prolongación San Ignacio Lima 01 - Santiago de Surco, Peru</h6>
                        <h6>Telefono: (01) 275-08-98</h6>
                        <h6>Copyrights © 2022 - Derechos Reservados</h6>
                    </div>
                    
                        
                    
           </footer>      
        
    </body>
</html>
