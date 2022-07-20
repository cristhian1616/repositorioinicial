package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.DAYS;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Cesta;
import modelo.Usuarios;
import utils.ConexionDB;

@WebServlet(name = "ServletReservar", urlPatterns = {"/ServletReservar"})
public class ServletReservar extends HttpServlet {

     /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        //
        String op = request.getParameter("op");
        HttpSession sesion = request.getSession();
        boolean aplicaOferta=false;
        String id_oferta="";
        Double porc_dcto=0.0,Tdia=0.0;
        
        if (op.equals("agregar")  || op.equals("editar") || op.equals("eliminar")) {
            
            //
            HttpSession sessionOk = request.getSession();
            Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
            //si objeto usuario se encuentra vacia necesita que le agregue informacion cada que se actualiza la página
            //menos la contraseña porque no se ha registrado, esta se queda como null, y lo agrego en tabla solo si no
            // tiene contraseña, es decir no se ha registrado. ahora, si ese usuario existe en la BD solo le actualizamos su informacion 
            //menos contraseña porque no se ha registrado
            //ahora, supongamos que hasta el final el cliente no haya ingresado sus datos lo vamos a obligar a que lo ponga primero mediante
            //otros artilugios
            //if (usuario==null) {
            boolean accedio = false;
            if (sessionOk.getAttribute("usuario")!=null) {
                if (usuario.getContraseña()!=null) { accedio=true;}
            }
            
            if (accedio==false) {
                String dni = "";
                String apell= "";
                String nomb = "";
                int telef=0;
                String corre= "";
                
                try {
                  if (request.getParameter("txthDni")!=null) { dni = ""+request.getParameter("txthDni"); }
                 if (request.getParameter("txthApellidos")!=null) {apell = request.getParameter("txthApellidos"); }
                 if (request.getParameter("txthNombres")!=null) {nomb = request.getParameter("txthNombres"); }
                 if (request.getParameter("txthTelefono")!=null) {telef = Integer.parseInt(request.getParameter("txthTelefono")); }
                 if (request.getParameter("txthCorreo")!=null) { corre = request.getParameter("txthCorreo"); }  
                } catch (Exception e) {
                }
                
                
                Usuarios usuarioNR =  new Usuarios(dni,apell,nomb,telef,corre,null,"Cliente");
                sessionOk.setAttribute("usuario", usuarioNR);
                
            }
                
            //}
            /*if (sessionOk.getAttribute("usuario")!=null) {
                if (usuario.getContraseña()==null) {
                    usuario.setCodUsu(request.getParameter(""));
                    usuario.setApellidos(request.getParameter(""));
                    usuario.setNombres(request.getParameter(""));
                    usuario.setTelefono(Integer.parseInt(request.getParameter("")));
                    usuario.setCorreo(request.getParameter(""));
                    }
                }*/
            
            
            
            
            
            
            
            
            
            
            //
            String f_entrada = request.getParameter("txthFEnt");
            String f_salida = request.getParameter("txthFSal");
            String dia = request.getParameter("txthdia");
            sesion.setAttribute("fecha_entrada", f_entrada);
            sesion.setAttribute("fecha_salida", f_salida);
            sesion.setAttribute("dia", dia);
            
            //
            
            if (dia.equals("Dia entero")) {  Tdia=1.00;
            }else if (dia.equals("Medio dia/noche")) {  Tdia=0.5;}
            
             
             //esto lo hago porque las horas y minutos solo aceptan ser de 2 digitos, o sea si fuera 5h se pondría 05h, igual con minutos
             
             int hora= LocalDateTime.now().getHour(), minuto=LocalDateTime.now().getMinute();
             String horas=""+hora,minutos=""+minuto;
             if (hora<10) {  horas= "0"+hora;    }  //if hora <= 10 sería 9h,8h,7h,etc y no 09h,08h,07h,etc. entonces agrego un dígito antes 
             if (minuto<10) {minutos="0"+minuto; }  //if min <= 10 sería 9min,8min,etc y no 09min,etc. entonces agrego un dígito antes
    
             String hora_actual= horas+":"+minutos;
             
             //
             
              String [] FE= f_entrada.split("-");
              String str = FE[0]+"-"+FE[1]+"-"+FE[2]+" "+hora_actual; 
              DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
              LocalDateTime dateTime = LocalDateTime.parse(str, formatter);

              long diasAnticipacion = DAYS.between(LocalDateTime.now(),dateTime) +1;
              //sesion.setAttribute("diasanticipacion", diasAnticipacion +1);    --> por si acaso lo quisiera usar adelante
              
              
              //
              String [] FS= f_salida.split("-");
              String str2 = FS[0]+"-"+FS[1]+"-"+FS[2]+" " +hora_actual; 
              DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
              LocalDateTime dateTime2 = LocalDateTime.parse(str2, formatter2);
              
              long diasHospedaje = DAYS.between(dateTime,dateTime2);
              if (diasHospedaje==0) { diasHospedaje=1; }
              sesion.setAttribute("diasHospedaje", diasHospedaje);
            
            
            //
            String diaSemana= ""+LocalDateTime.now().getDayOfWeek();
            if ((diaSemana.equals("TUESDAY")) && (request.getParameter("txtNombreHab").equals("HABITACION MATRIMONIAL"))) {
                id_oferta="OFER01";
                aplicaOferta=true;
            }else if ((diaSemana.equals("THURSDAY")) && (request.getParameter("txtNombreHab").equals("HABITACION MATRIM. DOBLE"))){
                id_oferta="OFER02";
                aplicaOferta=true;
            }else if ((diasAnticipacion>=3) && (request.getParameter("txtNombreHab").equals("HABITACION STANDAR"))){
                id_oferta="OFER03";
                aplicaOferta=true;
            }
            
            
            
            //
            PreparedStatement sta;
            try {
                sta = ConexionDB.getConexion().prepareStatement("SELECT porc_dcto from oferta WHERE id_oferta='"+id_oferta+"'");
                ResultSet rs= sta.executeQuery();
                rs.next();
                porc_dcto=rs.getDouble(1);
                //
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            
        }
        
        
        //
        
        if (op.equals("agregar")) {
            ///
            ArrayList<Cesta> reserva;
            
            //lo que recibo de mi combobox y cajita de texto(number) 
            String nombreHab = request.getParameter("txtNombreHab");
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            //
            Double precio=0.0;
            String codigo="";
            PreparedStatement sta;
            try {
                sta = ConexionDB.getConexion().prepareStatement("SELECT * from habitacion WHERE nombre='"+nombreHab+"'");
                ResultSet rs= sta.executeQuery();
                rs.next();
                codigo=rs.getString(1);
                precio=rs.getDouble(8);
                
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            
            //
            
            if (sesion.getAttribute("reserva")==null) {  reserva = new ArrayList<Cesta>();  }
            else {   reserva = (ArrayList<Cesta>)sesion.getAttribute("reserva");}
                
            {    
                 int indice=-1;
                 int tamaño=reserva.size();
                //
                for (int i = 0; i < tamaño; i++) {
                    if (reserva.get(i).getNombreHab().equals(nombreHab)) {   indice=i; }
                }
                
                if (indice==-1) {
                    Double subtotal =   precio*cantidad*Tdia*(long)sesion.getAttribute("diasHospedaje");  String idOfert= null;
                    if (aplicaOferta) {  subtotal = (1-porc_dcto)*precio*cantidad*Tdia*(long)sesion.getAttribute("diasHospedaje"); idOfert=id_oferta;}
                    
                    Cesta c = new Cesta(codigo,cantidad,nombreHab,subtotal,idOfert);
                    reserva.add(c);
                    
                }else{
                    int nuevaCant= reserva.get(indice).getCantidad()+cantidad;
                    Double nuevoSubtot= reserva.get(indice).getSubtotal()*nuevaCant;
                    reserva.get(indice).setCantidad(nuevaCant);
                    reserva.get(indice).setSubtotal(nuevoSubtot);
                }
                
                
                
                //para hallar el total
                double total =0.0;
                int nuevoTamaño=reserva.size();
                 for (int i = 0; i < nuevoTamaño; i++) {
                    total+= reserva.get(i).getSubtotal();
                }
                 
               sesion.setAttribute("total", total);
                
                
            
            }
           
            
            sesion.setAttribute("reserva",reserva);
            response.sendRedirect("reservar.jsp");
            
        }else if (op.equals("editar")){
            
            ///
            ArrayList<Cesta> reserv = (ArrayList<Cesta>)sesion.getAttribute("reserva");
            if (sesion.getAttribute("reserva")!=null) {
                
                 
                //lo que recibo de mi combobox y cajita de texto(number) 
                String nombreHab = request.getParameter("txtNombreHab");
                int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                //
                Double precio=0.0;
                PreparedStatement sta;
                try {
                    sta = ConexionDB.getConexion().prepareStatement("SELECT * from habitacion WHERE nombre='"+nombreHab+"'");
                    ResultSet rs= sta.executeQuery();
                    rs.next();
                    precio=rs.getDouble(8);
             
                } catch (SQLException ex) {
                    Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
                 }
            
            
                
                int tamaño=reserv.size();
                //
                for (int i = 0; i < tamaño; i++) {
                    if (reserv.get(i).getNombreHab().equals(nombreHab)) {   
                      reserv.get(i).setCantidad(cantidad);
                       Double subtotal =   precio*cantidad*Tdia*(long)sesion.getAttribute("diasHospedaje");  String idOfert= null;
                        if (aplicaOferta) { subtotal = (1-porc_dcto)*precio*cantidad*Tdia*(long)sesion.getAttribute("diasHospedaje"); idOfert=id_oferta;}
                      
                      reserv.get(i).setSubtotal(subtotal);
                      reserv.get(i).setId_oferta(idOfert);
                    
                    }
                }
                
              //para hallar el total
                double total =0.0;
                int nuevoTamaño=reserv.size();
                 for (int i = 0; i < nuevoTamaño; i++) {
                    total+= reserv.get(i).getSubtotal();
                }
                 
               sesion.setAttribute("total", total);
               
            }
            sesion.setAttribute("reserva",reserv);
            response.sendRedirect("reservar.jsp");
            
        }else if (op.equals("eliminar")){
            
            ///
            ArrayList<Cesta> reservv = (ArrayList<Cesta>)sesion.getAttribute("reserva");
            String nombreHab = request.getParameter("txtNombreHab");
            
            if (sesion.getAttribute("reserva")!=null) {
                
                int tamaño=reservv.size();
                //
                for (int i = 0; i < tamaño; i++) {
                    if (reservv.get(i).getNombreHab().equals(nombreHab)) {    
                        reservv.remove(i); 
                        break; 
                    }
                  }
                
                
                //para hallar el total
                double total =0.0;
                int nuevoTamaño=reservv.size();
                 for (int i = 0; i < nuevoTamaño; i++) {
                    total+= reservv.get(i).getSubtotal();
                }
                 
               sesion.setAttribute("total", total);
                
            }
            
            sesion.setAttribute("reserva",reservv);
            response.sendRedirect("reservar.jsp");
            
            
        }else if (op.equals("cancelar")){
            
            sesion.removeAttribute("fecha_entrada");
            sesion.removeAttribute("fecha_salida");
            sesion.removeAttribute("dia");
            sesion.removeAttribute("diasHospedaje");
            sesion.removeAttribute("total");
            sesion.removeAttribute("reserva"); //reserva es arrayList de los objetos Cesta
            response.sendRedirect("reservar.jsp");
            
            
        }else if (op.equals("reservar")){
            
            
            HttpSession sessionOk = request.getSession();
            Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
            boolean accedio = false;
            
            if (sessionOk.getAttribute("usuario")!=null) {    if (usuario.getContraseña()!=null) { accedio=true;}    }
            
            if (accedio==false) {
               
                String dni = request.getParameter("txtDni");
                String apell= request.getParameter("txtApellidos");
                String nomb = request.getParameter("txtNombres");
                int telef = Integer.parseInt(request.getParameter("txtTelefono"));
                String corre =request.getParameter("txtCorreo");
                
                Usuarios usuarioNR = new Usuarios(dni,apell,nomb,telef, corre, null,"Cliente");
                sessionOk.setAttribute("usuario", usuarioNR);
                
                
                
                
                
                //
                PreparedStatement prep,prep2;
                try {
                    prep = ConexionDB.getConexion().prepareStatement("INSERT INTO usuario VALUES(?,?,?,?,?,?,?)");
                    prep.setString(1, dni);
                    prep.setString(2, apell);
                    prep.setString(3, nomb);
                    prep.setInt(4, telef);
                    prep.setString(5, corre);
                    prep.setString(6, null);
                    prep.setString(7, "Cliente");
                    prep.executeUpdate();
                    
                    
                    prep2 = ConexionDB.getConexion().prepareStatement("INSERT INTO cliente VALUES('0',?,?,?)");
                    prep2.setString(1, null);
                    prep2.setString(2, "Activo");
                    prep2.setString(3, dni);
                    prep2.executeUpdate();
                    
                    
                } catch (Exception e) {
                    sesion.setAttribute("id_cliente_encontrado", e);
                    response.sendRedirect("reservar.jsp");
                }
            }
            
            
            ///
            
            
            
            ArrayList<Cesta> reserva = (ArrayList<Cesta>)sesion.getAttribute("reserva");
            
            
            Usuarios usu = (Usuarios)sesion.getAttribute("usuario");
            String dni_usuario = usu.getCodUsu();
            int id_cliente=0;
            
            PreparedStatement psta,psta2,psta3;
            try {
                //busco id_cliente y lo almaceno en una variable
                psta= ConexionDB.getConexion().prepareStatement("SELECT c.id_cliente FROM cliente  c "
                                                              + "INNER JOIN usuario u "
                                                              + "ON u.dni_usuario=c.usuario_dni_usuario "
                                                              + "WHERE u.dni_usuario='"+dni_usuario+"'");
                
                ResultSet resuss = psta.executeQuery();
                
                if (resuss.next()) {  id_cliente=resuss.getInt(1); }
                
                //inserto toda la informacion en la tabla reserva
                psta2 = ConexionDB.getConexion().prepareStatement("INSERT INTO reserva VALUES('0',?,?,?,?,?,?)",PreparedStatement.RETURN_GENERATED_KEYS);
                psta2.setString(1, ""+LocalDate.now());
                psta2.setString(2, ""+sesion.getAttribute("fecha_entrada"));
                psta2.setString(3, ""+sesion.getAttribute("fecha_salida"));
                psta2.setString(4, ""+sesion.getAttribute("dia"));
                psta2.setDouble(5, (double)sesion.getAttribute("total"));
                psta2.setInt(6, id_cliente);
                psta2.executeUpdate();
                
                ResultSet id_generado_psta2 = psta2.getGeneratedKeys();
                int id_reserva=0;
                if (id_generado_psta2.next()) {    id_reserva = id_generado_psta2.getInt(1);  }
                
                
                //inserto toda la informacion en la tabla detalle_reserva
                int Tamaño=reserva.size();
                 for (int i = 0; i < Tamaño; i++) {
                     
                    psta3 = ConexionDB.getConexion().prepareStatement("INSERT INTO detalle_reserva VALUES (?,?,?,?,?)");
                    psta3.setInt(1, id_reserva);//id_reserva
                    psta3.setString(2, reserva.get(i).getCodigo());//este codigo es el id_habitacion
                    psta3.setInt(3, reserva.get(i).getCantidad()); //cantidad habitaciones ese tipo
                    psta3.setDouble(4, reserva.get(i).getSubtotal()); //subtotal
                    psta3.setString(5, reserva.get(i).getId_oferta()); //id_oferta
                    psta3.executeUpdate();
                    
                    
                }
                 
                 
                
                sesion.setAttribute("id_reserva", id_reserva);
                sesion.removeAttribute("fecha_entrada");
                sesion.removeAttribute("fecha_salida");
                sesion.removeAttribute("dia");
                sesion.removeAttribute("diasHospedaje");
                sesion.removeAttribute("total");
                sesion.removeAttribute("reserva"); //reserva es arrayList de los objetos Cesta
                response.sendRedirect("reservar.jsp");
                
                
                 
            
             
        } catch (Exception ex) {
                
                sesion.setAttribute("mensajeError", "Tu cesta se encuentra vacía, agregue al menos una habitación para efectuar la reserva ");
                response.sendRedirect("reservar.jsp");
             
        }
            
            
           
            
            
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
