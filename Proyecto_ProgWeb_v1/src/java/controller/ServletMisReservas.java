package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.ReservaDetalles;
import modelo.Reservaciones;
import modelo.Usuarios;
import utils.ConexionDB;

/**
 *
 * @author ALEXANDER
 */
@WebServlet(name = "ServletMisReservas", urlPatterns = {"/ServletMisReservas"})
public class ServletMisReservas extends HttpServlet {

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
        
        
        if (op.equals("cancelarReserva"))  {
            
            int id_reserva= Integer.parseInt(request.getParameter("txtHidenIdReserva"));
            
            PreparedStatement sta;
            try {
                sta = ConexionDB.getConexion().prepareStatement("DELETE from detalle_reserva WHERE reserva_id_reserva =?");
                sta.setInt(1, id_reserva);
                sta.executeUpdate();
                
                //
                sta = ConexionDB.getConexion().prepareStatement("DELETE FROM `reserva` WHERE `reserva`.`id_reserva`=?");
                sta.setInt(1, id_reserva);
                sta.executeUpdate();
                
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
                
            }
            
            
            
            
            
            
            
            
            
            
        }
        
        if (op.equals("aplicar")) {
            
            String fechaEntrada = request.getParameter("txtReservaDesde");
            String fechaSalida = request.getParameter("txtReservaHasta");
            
             //
            PreparedStatement sta,staDet;
            try {
                
                sta = ConexionDB.getConexion().prepareStatement("SELECT * from reserva R "
                                                              + "INNER JOIN cliente C "
                                                              + "ON R.cliente_id_cliente=C.id_cliente "
                                                              + "WHERE R.fecha_reserva BETWEEN ? and ? "
                                                              + "AND C.usuario_dni_usuario=? order by R.fecha_reserva desc");
                sta.setString(1, fechaEntrada);
                sta.setString(2, fechaSalida);
                //
                HttpSession  sessionOk = request.getSession();
                Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
                sta.setString(3, usuario.getCodUsu());
                //
                ResultSet rs= sta.executeQuery();
                ArrayList<Reservaciones> ListaReservaciones = new ArrayList<>();
                while (rs.next()) {                    
                    int id_reserva = rs.getInt(1);
                    staDet = ConexionDB.getConexion().prepareStatement("SELECT * from detalle_reserva D "
                                                                     + "INNER JOIN habitacion H "
                                                                     + "ON D.habitacion_id_habitacion=H.id_habitacion "
                                                                     + "WHERE reserva_id_reserva='"+id_reserva+"'");
                    ResultSet rsDet= staDet.executeQuery();
                    ArrayList listaDetalles = new ArrayList();
                    
                    while (rsDet.next()) {
                         
                        ReservaDetalles reservDetall = new ReservaDetalles(rsDet.getInt(3),rsDet.getString(7),rsDet.getDouble(4),rsDet.getString(5));
                       
                        listaDetalles.add(reservDetall);
                        
                        
                    }
                    
                    Reservaciones reservacion = new Reservaciones(rs.getInt(1),""+rs.getDate(2),""+rs.getDate(3),""+rs.getDate(4),rs.getDouble(6), "", listaDetalles);
                    ListaReservaciones.add(reservacion);
                    
                }
                //
                request.setAttribute("listaReserv",ListaReservaciones );
                 request.getRequestDispatcher("misReservas.jsp").forward(request, response);
                
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            
            
        
        
        //
            
        }else if(op.equals("mostrarTodas") || op.equals("cancelarReserva")) {
            PreparedStatement sta,staDet;
            try {
                
                sta = ConexionDB.getConexion().prepareStatement("SELECT * from reserva R "
                                                              + "INNER JOIN cliente C "
                                                              + "ON R.cliente_id_cliente=C.id_cliente "
                                                              + "WHERE C.usuario_dni_usuario=? "
                                                              + "order by R.fecha_reserva desc");
                HttpSession  sessionOk = request.getSession();
                Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
                sta.setString(1, usuario.getCodUsu());
                
                ResultSet rs= sta.executeQuery();
                ArrayList<Reservaciones> ListaReservaciones = new ArrayList<>();
                while (rs.next()) {                    
                    int id_reserva = rs.getInt(1);
                    staDet = ConexionDB.getConexion().prepareStatement("SELECT * from detalle_reserva D "
                                                                     + "INNER JOIN habitacion H "
                                                                     + "ON D.habitacion_id_habitacion=H.id_habitacion "
                                                                     + "WHERE reserva_id_reserva='"+id_reserva+"'");
                    ResultSet rsDet= staDet.executeQuery();
                    ArrayList listaDetalles = new ArrayList();
                    
                    while (rsDet.next()) {
                         
                        ReservaDetalles reservDetall = new ReservaDetalles(rsDet.getInt(3),rsDet.getString(7),rsDet.getDouble(4),rsDet.getString(5));
                       
                        listaDetalles.add(reservDetall);
                        
                        
                    }
                    
                    Reservaciones reservacion = new Reservaciones(rs.getInt(1),""+rs.getDate(2),""+rs.getDate(3),""+rs.getDate(4),rs.getDouble(6),"",listaDetalles);
                    ListaReservaciones.add(reservacion);
                    
                }
                //
                request.setAttribute("listaReserv",ListaReservaciones );
                 request.getRequestDispatcher("misReservas.jsp").forward(request, response);
                
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            
            
        }else if (op.equals("mostrarTodasAdmi")) {
            
            PreparedStatement sta,staDet;
            try {
                
                sta = ConexionDB.getConexion().prepareStatement("SELECT * from reserva R "
                                                              + "INNER JOIN cliente C "
                                                              + "ON R.cliente_id_cliente=C.id_cliente "
                                                              + "order by R.fecha_reserva desc");
                
                
                ResultSet rs= sta.executeQuery();
                ArrayList<Reservaciones> ListaReservaciones = new ArrayList<>();
                while (rs.next()) {                    
                    int id_reserva = rs.getInt(1);
                    staDet = ConexionDB.getConexion().prepareStatement("SELECT * from detalle_reserva D "
                                                                     + "INNER JOIN habitacion H "
                                                                     + "ON D.habitacion_id_habitacion=H.id_habitacion "
                                                                     + "WHERE reserva_id_reserva='"+id_reserva+"'");
                    ResultSet rsDet= staDet.executeQuery();
                    ArrayList listaDetalles = new ArrayList();
                    
                    while (rsDet.next()) {
                         
                        ReservaDetalles reservDetall = new ReservaDetalles(rsDet.getInt(3),rsDet.getString(7),rsDet.getDouble(4),rsDet.getString(5));
                       
                        listaDetalles.add(reservDetall);
                        
                        
                    }
                    
                    Reservaciones reservacion = new Reservaciones(rs.getInt(1),""+rs.getDate(2),""+rs.getDate(3),""+rs.getDate(4),rs.getDouble(6),rs.getString(11),listaDetalles);
                    ListaReservaciones.add(reservacion);
                    
                }
                //
                request.setAttribute("listaReserv",ListaReservaciones );
                 request.getRequestDispatcher("reservacionesAdm.jsp").forward(request, response);
                
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            
            
        }else if (op.equals("aplicarAdmi")) {
            
            String fechaEntrada = request.getParameter("txtReservaDesde");
            String fechaSalida = request.getParameter("txtReservaHasta");
            
             //
            PreparedStatement sta,staDet;
            try {
                
                sta = ConexionDB.getConexion().prepareStatement("SELECT * from reserva R "
                                                              + "INNER JOIN cliente C "
                                                              + "ON R.cliente_id_cliente=C.id_cliente "
                                                              + "WHERE R.fecha_reserva BETWEEN ? and ? "
                                                              + "order by R.fecha_reserva desc");
                sta.setString(1, fechaEntrada);
                sta.setString(2, fechaSalida);
                //
                
                //
                ResultSet rs= sta.executeQuery();
                ArrayList<Reservaciones> ListaReservaciones = new ArrayList<>();
                while (rs.next()) {                    
                    int id_reserva = rs.getInt(1);
                    staDet = ConexionDB.getConexion().prepareStatement("SELECT * from detalle_reserva D "
                                                                     + "INNER JOIN habitacion H "
                                                                     + "ON D.habitacion_id_habitacion=H.id_habitacion "
                                                                     + "WHERE reserva_id_reserva='"+id_reserva+"'");
                    ResultSet rsDet= staDet.executeQuery();
                    ArrayList listaDetalles = new ArrayList();
                    
                    while (rsDet.next()) {
                         
                        ReservaDetalles reservDetall = new ReservaDetalles(rsDet.getInt(3),rsDet.getString(7),rsDet.getDouble(4),rsDet.getString(5));
                       
                        listaDetalles.add(reservDetall);
                        
                        
                    }
                    
                    Reservaciones reservacion = new Reservaciones(rs.getInt(1),""+rs.getDate(2),""+rs.getDate(3),""+rs.getDate(4),rs.getDouble(6), rs.getString(11), listaDetalles);
                    ListaReservaciones.add(reservacion);
                    
                }
                //
                request.setAttribute("listaReserv",ListaReservaciones );
                 request.getRequestDispatcher("reservacionesAdm.jsp").forward(request, response);
                
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            
            
        
        
        //
            
            
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
