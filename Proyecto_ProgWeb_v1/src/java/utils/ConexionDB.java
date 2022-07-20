package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.time.LocalDateTime;

public class ConexionDB {

     public static Connection getConexion(){
         Connection con = null;
         
        String cadena = "jdbc:mysql://localhost/hotel?user=root&password=";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(cadena);
            System.out.println("Conexion satisfactoria");
        }catch(Exception e){
            System.out.println("Error de conexion");
        }
        
        return con;
    }
     
     
    public static void main(String[] args) {
         getConexion();
         
         
         
    }

    public static Object getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
