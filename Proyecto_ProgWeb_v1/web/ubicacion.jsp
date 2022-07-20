<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Hotel Secretos - Ubicacion</title>
        <link rel="shortcut icon" href="imagenes/logo_hotel_secretos.ico">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <link href="css/index.css" rel="stylesheet">
        <link href="css/index2.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    </head>
    
    <body>
        
           <%@include file='WEB-INF/jspf/header.jspf' %>
                
                <div class="nombreHotel">
                        <h2>UBICACION </h2>
                </div> 
                <div class="ubicacion">
            <h2>Atencion de primer nivel en Surco</h2>
                </div> 
            </header>
        
        
        
        
        <br>
        
        
                        
        <section class="wrapper">
           
        <div class ="container">
             <p class="ubi">Somos una empresa dedicado al rubro hotelero, en todos nuestros locales se siente el ambiente cálido y acogedor donde te brindamos el mejor servicio personalizado. Contamos con diversas habitaciones a los mejores precios, nuestra empresa apuesta por la higiene, discreción y seguridad para que usted se sienta como en su casa.
             <b>!Nuestra prioridad son nuestros clientes!</b> </p>
             <div class="ratio ratio-21x9">
                 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d249799.5707277746!2d-77.24531969008522!3d-11.966311028285334!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105b865773c1d6b%3A0x6cc22f0ae5efb759!2sHostal%20Secretos!5e0!3m2!1ses-419!2spe!4v1653679901505!5m2!1ses-419!2spe" title="mapa hotel secretos" allowfullscreen></iframe>
             </div>
       
        </div>
        </section>
        
        
        
        
        
        <br>
            
       
            
        
            
                
                
                
                 <footer class="bg-black text-white">
                    
                    <div class="container text-center">
                        <h6>Dirección:  Av. La Rosa Lozano y Tirado 1268, Prolongación San Ignacio Lima 01 - Santiago de Surco, Peru</h6>
                        <h6>Telefono: (01) 275-08-98</h6>
                        <h6>Copyrights © 2022 - Derechos Reservados</h6>
                    </div>
                    
                        
                    
                </footer>
    </body>
</html>


