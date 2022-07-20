package modelo;

public class Cesta {
    
    private String codigo;
    private int cantidad;
    private String nombreHab;
    private Double subtotal;
    private String id_oferta;
    
    //Constructor
    public Cesta(String codigo, int cantidad, String nombreHab, Double subtotal, String id_oferta) {
        this.codigo = codigo;
        this.cantidad = cantidad;
        this.nombreHab = nombreHab;
        this.subtotal = subtotal;
        this.id_oferta = id_oferta;
    }
    
    //Getters and Setters
    public String getCodigo() {  return codigo;  }
    public int getCantidad() {  return cantidad;   }
    public String getNombreHab() {  return nombreHab;  }
    public Double getSubtotal() {  return subtotal;  }
    public String getId_oferta() {  return id_oferta;  }

    public void setCodigo(String codigo) {  this.codigo = codigo; }
    public void setCantidad(int cantidad) {  this.cantidad = cantidad;  }
    public void setNombreHab(String nombreHab) {  this.nombreHab = nombreHab; }
    public void setSubtotal(Double subtotal) {  this.subtotal = subtotal; }
    public void setId_oferta(String id_oferta) {  this.id_oferta = id_oferta; }
    
    
    
    
}
