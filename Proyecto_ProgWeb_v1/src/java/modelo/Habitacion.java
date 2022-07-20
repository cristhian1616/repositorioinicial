package modelo;

import java.util.ArrayList;

public class Habitacion {
    private String codigo;
    private String nombre;
    private String desc_gen;
    private ArrayList desc_espec;
    private double precio;
    
    //Constructor
    public Habitacion(String codigo, String nombre, String desc_gen, ArrayList desc_espec, double precio) {
            this.codigo = codigo;
            this.nombre = nombre;
            this.desc_gen = desc_gen;
            this.desc_espec = desc_espec;
            this.precio = precio;
        }  
    
    //Getters and Setters
    
    public String getCodigo() { return codigo; }
    public String getNombre() {   return nombre; }
    public String getDesc_gen() { return desc_gen; }
    public ArrayList getDesc_espec() {  return desc_espec; }
    public double getPrecio() {  return precio; }

    public void setCodigo(String codigo) { this.codigo = codigo;  }
    public void setNombre(String nombre) {   this.nombre = nombre; }
    public void setDesc_gen(String desc_gen) { this.desc_gen = desc_gen;}
    public void setDesc_espec(ArrayList desc_espec) {  this.desc_espec = desc_espec; }
    public void setPrecio(double precio) {this.precio = precio; }
    
    
}
