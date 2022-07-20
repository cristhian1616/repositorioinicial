package modelo;

import java.util.ArrayList;

public class Reservaciones {
    private int id_reserva;
    private String fechaReserva;
    private String fechaEntrada;
    private String fechaSalida;
    private double total;
    private String dni;
    private ArrayList<ReservaDetalles> detalles;

    //
    public Reservaciones(int id_reserva, String fechaReserva, String fechaEntrada, String fechaSalida, double total, String dni,  ArrayList<ReservaDetalles> detalles) {
        this.id_reserva = id_reserva;
        this.fechaReserva = fechaReserva;
        this.fechaEntrada = fechaEntrada;
        this.fechaSalida = fechaSalida;
        this.total = total;
        this.dni = dni;
        this.detalles = detalles;
    }

    //
    public int getId_reserva() {   return id_reserva; }
    public String getFechaReserva() {  return fechaReserva; }
    public String getFechaEntrada() {  return fechaEntrada; }
    public String getFechaSalida() { return fechaSalida; }
    public double getTotal() { return total; }
    public ArrayList<ReservaDetalles> getDetalles() { return detalles; }
    public String getDni() {  return dni; }

    //
    public void setId_reserva(int id_reserva) { this.id_reserva = id_reserva; }
    public void setFechaReserva(String fechaReserva) {  this.fechaReserva = fechaReserva;  }
    public void setFechaEntrada(String fechaEntrada) {  this.fechaEntrada = fechaEntrada;}
    public void setFechaSalida(String fechaSalida) { this.fechaSalida = fechaSalida; }
    public void setTotal(double total) { this.total = total; }
    public void setDetalles(ArrayList<ReservaDetalles> detalles) { this.detalles = detalles; }
    public void setDni(String dni) { this.dni = dni; }

    

    
    
    
    
    
}
