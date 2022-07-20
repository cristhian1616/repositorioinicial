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
        <title>Hotel Secretos - CONTACTENOS</title>
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
                        <h2>CONTACTANOS</h2>
                </div> 
                
            </header>
        
        
        
        
        <br>
        
        
                        
        <section class="wrapper">
           
           <div class="container bg-succes">
               <form action="" class="needs-validation">
                   
                <div class="mb-4">
               <label for="exampleFormControlInput1" class="form-label">Nombre</label>
               <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Jose Ignacio Lopez Peralta" required>
                </div>
               <div class="mb-4">
               <label for="exampleFormControlInput1" class="form-label">Correo</label>
               <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Jose123@gmail.com" required>
                </div>
               <div class="mb-4">
               <label for="exampleFormControlInput1" class="form-label">Telefono</label>
               <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="949494949" required>
                </div>
                <div class="mb-4">
                <label for="exampleFormControlTextarea1" class="form-label" >Mensaje</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Expliquenos en que podemos ayudarle" required></textarea>
                </div>
                 <div class="text-center">
                       <input class="btn btn-dark text-center" type="submit" value="ENVIAR MENSAJE" id="boton">
                </div> 
               
               </form> 
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