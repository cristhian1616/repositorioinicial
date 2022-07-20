package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuarios;
import utils.ConexionDB;



@WebServlet(name = "ServletMiPerfil", urlPatterns = {"/ServletMiPerfil"})
public class ServletMiPerfil extends HttpServlet {

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
        
        String op = request.getParameter("op");
        
        
        if (op.equals("actualizaDatosPersonales")) {
            HttpSession sessionOk = request.getSession();
            Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
            String apellidos = request.getParameter("txtApellidos");
            String nombres = request.getParameter("txtNombres");
            
            PreparedStatement sta;
            try {
                sta = ConexionDB.getConexion().prepareStatement("UPDATE usuario set apellidos=?, nombres=? WHERE dni_usuario=?");
                sta.setString(1, apellidos);
                sta.setString(2, nombres);
                sta.setString(3, usuario.getCodUsu());
                sta.executeUpdate();
                //
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            //
            usuario.setApellidos(apellidos);
            usuario.setNombres(nombres);
            sessionOk.setAttribute("usuario",usuario );
            response.sendRedirect("miPerfil.jsp");
            //
            
        }else if(op.equals("actualizarContacto")) {
            
            HttpSession sessionOk = request.getSession();
            Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
            int telefono = Integer.parseInt(request.getParameter("txtTelefono"));
            String correo = request.getParameter("txtCorreo");
            
            PreparedStatement sta;
            try {
                sta = ConexionDB.getConexion().prepareStatement("UPDATE usuario set telefono=?, correo=? WHERE dni_usuario=?");
                sta.setInt(1, telefono);
                sta.setString(2, correo);
                sta.setString(3, usuario.getCodUsu());
                sta.executeUpdate();
                //
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            //
            usuario.setTelefono(telefono);
            usuario.setCorreo(correo);
            sessionOk.setAttribute("usuario",usuario );
            response.sendRedirect("miPerfil.jsp");
            //
            
            
        }else if(op.equals("actualizarSesion")) {
            
            HttpSession sessionOk = request.getSession();
            Usuarios usuario = (Usuarios)sessionOk.getAttribute("usuario");
            String contraActual = (String)request.getParameter("txtContraActual");
            String contraNueva = (String)request.getParameter("txtContraNueva");
            String contraReal = usuario.getContraseña().toString();
            if (!(contraActual.equalsIgnoreCase(contraReal))) {
                sessionOk.setAttribute("mensajeMiPerfil","la contraseña actual ingresada es incorrecta" );
                response.sendRedirect("miPerfil.jsp");
            }else{
                
                
                
                
                PreparedStatement sta;
            try {
                sta = ConexionDB.getConexion().prepareStatement("UPDATE usuario set contrasena=? WHERE dni_usuario=?");
                sta.setString(1, contraNueva);
                sta.setString(2, usuario.getCodUsu());
                sta.executeUpdate();
                //
             
            } catch (SQLException ex) {
                Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex); 
            }
            
            //
            usuario.setContraseña(contraNueva);
            sessionOk.setAttribute("usuario",usuario);
            sessionOk.setAttribute("mensajeMiPerfil","Contraseña actualizada satisfactoriamente" );
            response.sendRedirect("miPerfil.jsp");
                
                
                
                
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
