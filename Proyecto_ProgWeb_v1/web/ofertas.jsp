<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Ofertas"%>
<% 
    String nombres="";
    boolean accedio=false;
    Usuarios usuario=null;
    
    
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
        <title>Hotel Secretos - Ofertas</title>
        <link rel="shortcut icon" href="imagenes/logo_hotel_secretos.ico">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <h2>OFERTAS </h2>
                </div> 
  
            </header>
        
        
             <%
         ArrayList<Ofertas> listaOfe = (ArrayList<Ofertas>)request.getAttribute("listaOfe");
                    
        
        %>
        <section class="wrapper">
            <div class="container">
                <section class="main">
                   <div class="row  text-center text-dark">
                         <div class="col-12 col-md-6 col-lg-4">
                                <h6 align="center"><%=listaOfe.get(0).getNombre()%></h6>
				<div class="alert alert  ">
                                    <img src="imagenes/oferta1.jpg" class="card-img img-fluid text-center" alt="...">
                                    <h7><%=listaOfe.get(0).getDescripcion()%></h7>
                                    <div class="card-img-overlay">
                                        <h5 class="card-title"><img src="imagenes/InconOferta20porcto.png"  alt="alt"/></h5>
                                        
                                    </div>
                                    
                                </div>
                                    
                        </div>
                        <div class="col-12 col-md-6 col-lg-4">
                                <h6 align="center"><%=listaOfe.get(1).getNombre()%></h6>
				<div class="alert alert ">
                                    <img src="imagenes/oferta2.jpg" class="card-img" alt="...">
                                    <h7><%=listaOfe.get(1).getDescripcion()%></h7>
                                    <div class="card-img-overlay">
                                        <h5 class="card-title"><img src="imagenes/InconOferta10porcto.png"  alt="alt"/></h5>
                                        
                                    </div>
                                </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-4">
                                <h6 align="center"><%=listaOfe.get(2).getNombre()%></h6>
				<div class="alert alert ">
                                    <img src="imagenes/oferta3.jpg" class="card-img" alt="...">
                                    <h7><%=listaOfe.get(2).getDescripcion()%></h7>
                                    <div class="card-img-overlay">
                                        <h5 class="card-title"><img src="imagenes/InconOferta5porcto.png"  alt="alt"/></h5>
                                    </div>
                                </div>
                        </div>
                         <div class="col-12 col-md-6 col-lg-4">
                                <h6 align="center"><%=listaOfe.get(3).getNombre()%></h6>
				<div class="alert alert ">
                                    <img src="imagenes/oferta4.jpg" class="card-img" alt="...">
                                    <h7><%=listaOfe.get(3).getDescripcion()%></h7>
                                    <div class="card-img-overlay">
                                        <h5 class="card-title"><img src="imagenes/InconOfertaComidaFree.png"  alt="alt"/></h5>
                                    </div>
                                </div>
                        </div>            
                        
                           
                   </div> 
                                   
                    
                         
                        
                           
                  
                </section>
            </div>
          </section>  
                
                
         <footer class="bg-black text-white">
                    
                    <div class="container text-center">
                        <h6>Dirección:  Av. La Rosa Lozano y Tirado 1268, Prolongación San Ignacio Lima 01 - Santiago de Surco, Peru</h6>
                        <h6>Telefono: (01) 275-08-98</h6>
                        <h6>Copyrights © 2022 - Derechos Reservados</h6>
                    </div>
                    
                        
                    
           </footer>
    </body>
</html>
