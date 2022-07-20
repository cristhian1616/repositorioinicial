/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuarios;
import utils.ConexionDB;

/**
 *
 * @author b
 */
@WebServlet(name = "ServletSesion", urlPatterns = {"/ServletSesion"})
public class ServletSesion extends HttpServlet {

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
        
          if (op.equals("login")) {
            
            
           
            
            String correo= request.getParameter("txtCorreo");
            String pass= request.getParameter("txtPass");
            
            try{
                PreparedStatement psta = ConexionDB.getConexion().
                        prepareStatement("SELECT * FROM usuario where correo=? and contrasena=?");
                psta.setString(1, correo);
                psta.setString(2, pass);
                ResultSet rs=psta.executeQuery();
                
                if (rs.next()) {
                    HttpSession sesionOk = request.getSession();
                    Usuarios usuario = new Usuarios(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),
                                                    rs.getString(5),rs.getString(6),rs.getString(7));
                    
                    sesionOk.setAttribute("usuario", usuario);
                    
                    
                    request.getRequestDispatcher("index.jsp").forward(request, response);                   
                }else{
                    request.setAttribute("msg", "Usuario o contraseña incorrectas");
                    request.getRequestDispatcher("Sesion.jsp").forward(request, response);
                }
            }catch(Exception e ){System.out.println("Error"+e);}
            
        }else if (op.equals("cerrar")) {
            HttpSession sesionOk= request.getSession();
            sesionOk.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
