<%@page import="java.time.LocalDateTime"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="modelo.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nombres = "";
    boolean accedio = false;
    Usuarios usuario = null;
    
    int numeroMesActual= LocalDateTime.now().getMonthValue();
    String mesActual; 
    if (numeroMesActual<10) { mesActual= "0"+numeroMesActual;  }
    else { mesActual= ""+numeroMesActual;}
    
    String fechaHoy= LocalDateTime.now().getYear()+"-"+mesActual+"-"+LocalDateTime.now().getDayOfMonth();
    
    HttpSession sessionOk = request.getSession();
    if (sessionOk.getAttribute("usuario") != null) {

        usuario = (Usuarios) sessionOk.getAttribute("usuario");
        if (usuario.getContraseña() != null) {
            accedio = true;
        }

    }


%>
<html>
    <head>
        <title>Hotel Secretos - Principal</title>
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
            <h2>HOTEL SECRETOS </h2>
        </div> 

    </header>

    <section class="wrapper">

        <section class="main">
            <div class="container">
                <div class="row informacion text-center">
                    <%
                        if (request.getParameter("msg2") != null) {
                            String msg2 = request.getParameter("msg2").toString();
                    %>

                    <div class="col-12 alert alert-danger text-center" role="alert">
                        <%=msg2%>
                    </div>

                    <%
                        }
                    %>
                    <div class="col-12 col-lg-4">
                        <div class="alert alert">
                            <h5>Tv con cable  <span class="material-icons">tv</span>  </h5>
                            <p>Nuestro hotel cuenta con servicio de cable con un acceso a más de 100 canales nacionales e internacionales</p>   
                        </div>
                    </div>
                    <div class="col-6 col-lg-4">
                        <div class="alert alert">
                            <h5>Wi-Fi gratis  <span class="material-icons">wifi</span>  </h5>
                            <p>Contamos con servicio de internet a gran velocidad totalmente gratis para todos nuestros clientes </p>   
                        </div>
                    </div>
                    <div class="col-6 col-lg-4">
                        <div class="alert alert">
                            <h5>Cochera  <span class="material-icons">garage</span>  </h5>
                            <p>Brindamos el servicio de cochera para nuestros clientes durante el tiempo que se hospede</p>   
                        </div>
                    </div>
                </div>
            </div>




            <div class="container">
                <div class="row carrusel bg-dark">

                    <div class="col-12">
                        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active" data-bs-interval="10000">
                                    <img src="imagenes/HabStandar.jpg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        
                                        <h3>HABITACION STANDAR</h3>
                                        <h6>S/35 la noche.</h6>
                                        <h2>
                                            <form action="ServletReservar?op=agregar">
                                                <input type="hidden" name="txthDni" id="txthDni" />
                                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="HABITACION STANDAR"/>
                                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                                ¡RESERVAR AHORA!
                                                </button>
                                            </form>
                                        </h2>
                                    </div>
                                    <div class="carousel-caption d-block d-md-none">
                                        <h6>HAB.STANDAR - S/35 x noche </h6>
                                        <h6>
                                            <form action="ServletReservar?op=agregar">
                                                <input type="hidden" name="txthDni" id="txthDni" />
                                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="HABITACION STANDAR"/>
                                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                                ¡RESERVAR AHORA!
                                                </button>
                                            </form>
                                        
                                        </h6>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="imagenes/HabMatrimonial.jpg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>HABITACION MATRIMONIAL</h3>
                                        <h6>S/45 la noche.</h6>
                                        <h2>
                                            <form action="ServletReservar?op=agregar">
                                                <input type="hidden" name="txthDni" id="txthDni" />
                                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="HABITACION MATRIMONIAL"/>
                                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                                ¡RESERVAR AHORA!
                                                </button>
                                            </form>
                                        </h2>
                                    </div>
                                    <div class="carousel-caption d-block d-md-none">
                                        <h6>HAB. MATRIMONIAL - S/45 x noche </h6>
                                        <h6>
                                            <form action="ServletReservar?op=agregar">
                                                <input type="hidden" name="txthDni" id="txthDni" />
                                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="HABITACION MATRIMONIAL"/>
                                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                                ¡RESERVAR AHORA!
                                                </button>
                                            </form>
                                        </h6>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="imagenes/HabDobleMatrimonial.jpg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>HABITACION MATRIMONIAL DOBLE</h3>
                                        <h6>S/75 la noche.</h6>
                                        <h2>
                                            <form action="ServletReservar?op=agregar">
                                                <input type="hidden" name="txthDni" id="txthDni" />
                                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="HABITACION MATRIM. DOBLE"/>
                                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                                ¡RESERVAR AHORA!
                                                </button>
                                            </form>
                                        </h2>
                                    </div>
                                    <div class="carousel-caption d-block d-md-none">
                                        <h6>HAB. MATRIMONIAL DOBLE - S/75 x noche </h6>
                                        <h6>
                                            <form action="ServletReservar?op=agregar">
                                                <input type="hidden" name="txthDni" id="txthDni" />
                                                <input type="hidden" name="txthApellidos" id="txthApellidos" />
                                                <input type="hidden" name="txthNombres" id="txthNombres" />
                                                <input type="hidden" name="txthTelefono" id="txthTelefono" />
                                                <input type="hidden" name="txthCorreo" id="txthCorreo" />
                                                <input type="hidden" name="txthFEnt" id="txthFEnt" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthFSal" id="txthFSal" Value="<%=fechaHoy%>"/>
                                                <input type="hidden" name="txthdia" id="txthdia" value="Medio dia/noche"/>
                                                <input type="hidden" name="txtNombreHab" id="txtNombreHab" value="HABITACION MATRIM. DOBLE"/>
                                                <input type="hidden" name="txtCantidad" id="txtCantidad" value="1"/>
                                                <button type="submit" class="btn text-success" name="op" id="btn_agregar" value="agregar" title="Agregar" >
                                                ¡RESERVAR AHORA!
                                                </button>
                                            </form>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>   
            </div>



            <div class="container">
                <div class="row informacion2 text-center text-muted">
                    <div class="col-12 col-lg-4">
                        <div class="alert alert " >
                            <img src="imagenes/timbreDeMano.jpg"  alt="...">
                            <p>Brindamos una atención amable para el público en general, nuestro personal lo atenderá de manera rápida y le
                                brindará toda la información necesaria para que tome la habitación de acuerdo a sus necesidades.</p>


                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="alert alert ">
                            <img src="imagenes/comida1.jpg"  alt="..."> 
                            <p>Contamos con servicio a la habitación con una variedad de platos en donde se podrá comunicar a recepción
                                con un teléfono dentro del mismo para que el personal lleve su pedido lo más rápido posible</p>


                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="alert alert">
                            <img src="imagenes/familia1.jpg"  alt="...">
                            <p>Nuestro hotel es el lugar perfecto para pasarla bonito durante el tiempo de su alojamiento, no solo en compañia de las personas afines
                                con las que asista sino también de manera individual</p>


                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row informacion2 text-center text-muted">
                    <div class="col-12 col-lg-4">
                        <div class="alert alert " >
                            <img src="imagenes/HabStandar.jpg"  alt="...">
                            <p>Garantizamos una máxima limpieza en todas nuestras habitaciones antes del ingreso de nuestros clientes y después de estos</p> 


                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="alert alert ">
                            <img src="imagenes/recepcion.jpg"  alt="..."> 
                            <p>Nuestra sala de recepción es un ambiente muy cómodo donde a usted se le brindará las facilidades para ser atendido </p>


                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="alert alert">
                            <img src="imagenes/personalTrabajo.jpg"  alt="...">
                            <p>Ante eventualidades nuestro personal está capacitado para tomar acciones y así poder brindar seguridad a los clientes</p>


                        </div>
                    </div>
                </div>
            </div>



        </section>

    </section>

    <div class="container">
        <section class="nosotros">
            <h3 class="text-center">NOSOTROS</h3>
            <br>
            <p class="section-subheading text-muted">Somos una empresa hotelera que brinda servicio de alojamiento por más de 15 años en el Perú, el respeto hacia las demás personas así como 
                la honestidad y la gratitud son cualidades que nos identifica. Nuestra misión es brindar servicio de calidad para nuestros clientes y
                nuestra visión es ser una empresa reconocida que compita junto a otras de gran nivel dentro de este rubro.
            </p>
            <br>
            <h4 class="text-muted text-center">HISTORIA</h4>
            <ul class="lineaTiempo">
                <li>
                    <div class="row ">
                        <div class="col-12 col-lg-6 d-none d-lg-block">
                            <div class="alert alert">
                                <img  src="imagenes/construccionHotel.jpg" alt="..." width="420" height="200" class="rounded" />
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="alert alert">
                                <h5>2006-2011</h5>
                                <div class="timeline-body"><p class="text-muted">En el 2006 empezamos la construcción del hotel con una capital ajustada para 2 pisos, pero con las ganas de brindar la mejor atención posible
                                        a los nuevos clientes, con el paso del tiempo nuestra empresa empezó a dar sus primeros frutas y los
                                        clientes se volvieron más recurrentes</p></div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 d-block d-lg-none">
                            <div class="alert alert">
                                <img  src="imagenes/construccionHotel.jpg" alt="..." width="420" height="200" class="rounded"/>
                            </div>
                        </div>

                    </div>


                </li>

                <li>
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="alert alert">
                                <h5>2011-2016</h5>
                                <div class="timeline-body"><p class="text-muted">En el 2011 construimos 2 pisos más para abastecer la demanda y logramos crecer económicamente en donde ahora venían
                                        familiares y conocidos de nuestros clientes por las buenas recomendaciones</p></div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 ">
                            <div class="alert alert ">
                                <img  src="imagenes/imghotel2.JPG" alt="..." width="420" height="200" class="rounded" />
                            </div>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="row">
                        <div class="col-12 col-lg-6 d-none d-lg-block">
                            <div class="alert alert">
                                <img  src="imagenes/imgInteriores.JPG" alt="..." width="420" height="200" class="rounded"/>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="alert alert">
                                <h5>2016-2021</h5>
                                <div class="timeline-body"><p class="text-muted">En el 2016 hicimos remodelaciones en los interiores y así los muebles y demás dentro de cada habitación para ofrecer no solo una
                                        mejor vista sino también la máxima comodidad posible</p></div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 d-block d-lg-none">
                            <div class="alert alert">
                                <img  src="imagenes/imgInteriores.JPG" alt="..." width="420" height="200" class="rounded"/>
                            </div>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="alert alert">
                                <h5>2021-Actualidad</h5>
                                <div class="timeline-body"><p class="text-muted">En 2021 tomamos la decisión de mejorar el marketing para que personas del extranjero también puedan sentirse en gran comodidad y confianza 
                                        al hospedarse en nuestro hotel, fue así como se pudo obtener resultados positivos hasta la fecha</p></div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="alert alert">
                                <img  src="imagenes/imghotel1.JPG" alt="..." width="420" height="200" class="rounded"/>
                            </div>
                        </div>   
                    </div>
                </li>
            </ul>

        </section>
    </div>



    <footer class="bg-black text-white">

        <div class="container text-center">
            <h6>Dirección:  Av. La Rosa Lozano y Tirado 1268, Prolongación San Ignacio Lima 01 - Santiago de Surco, Perú</h6>
            <h6>Telefono: (01) 275-08-98</h6>
            <h6>Copyrights © 2022 - Derechos Reservados</h6>
        </div>



    </footer>


</body>
</html>