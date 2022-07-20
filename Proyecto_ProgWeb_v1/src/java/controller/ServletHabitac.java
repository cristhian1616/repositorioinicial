/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
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
import modelo.Habitacion;
import utils.ConexionDB;


/**
 *
 * @author ALEXANDER
 */
@WebServlet(name = "ServletHabitac", urlPatterns = {"/ServletHabitac"})
public class ServletHabitac extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");
        
       
           
       
       
        
        //
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
           PreparedStatement sta;
        try {
            sta = ConexionDB.getConexion().prepareStatement("SELECT * from habitacion");
            ResultSet rs= sta.executeQuery();
            ArrayList<Habitacion> lista = new ArrayList<>();
            
            while(rs.next()) {    
                    ArrayList desc_especif = new ArrayList();
                    for (int i = 4; i < 8; i++) {
                        desc_especif.add(rs.getString(i));
                    }
                    
                    Habitacion hab= new Habitacion(rs.getString(1),rs.getString(2),rs.getString(3), desc_especif ,rs.getDouble(8));
                    lista.add(hab); 
                    
                } 
            
            
             request.setAttribute("listaHab",lista );
             request.getRequestDispatcher("habitaciones.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServletHabitac.class.getName()).log(Level.SEVERE, null, ex);
             
             
        }
         
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
