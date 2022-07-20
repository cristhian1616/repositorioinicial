package modelo;

public class ReservaDetalles {
    private int cantidad;
    private String tipo;
    private Double subtotal;
    private String dctoAplicado;

    public ReservaDetalles(int cantidad, String tipo, Double subtotal, String dctoAplicado) {
        this.cantidad = cantidad;
        this.tipo = tipo;
        this.subtotal = subtotal;
        this.dctoAplicado = dctoAplicado;
    }

    //
    public int getCantidad() {   return cantidad; }
    public String getTipo() {  return tipo; }
    public Double getSubtotal() { return subtotal;  }
    public String getDctoAplicado() {  return dctoAplicado; }

    //
    public void setCantidad(int cantidad) {  this.cantidad = cantidad;  }
    public void setTipo(String tipo) {  this.tipo = tipo;  }
    public void setSubtotal(Double subtotal) {   this.subtotal = subtotal; }
    public void setDctoAplicado(String dctoAplicado) {   this.dctoAplicado = dctoAplicado;  }
    
    
    
    
}
