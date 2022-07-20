package modelo;

public class Usuarios {
    private String dni;
    private String apellidos;
    private String nombres;
    private int telefono;
    private String correo;
    private String contraseña;
    private String tipo_usuario;

    public Usuarios(String dni, String apellidos, String nombres, int telefono, String correo, String contraseña, String tipo_usuario) {
        this.dni = dni;
        this.apellidos = apellidos;
        this.nombres = nombres;
        this.telefono = telefono;
        this.correo = correo;
        this.contraseña = contraseña;
        this.tipo_usuario = tipo_usuario;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public String getCodUsu() {
        return dni;
    }

    public void setCodUsu(String dni) {
        this.dni = dni;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    
    
    
    
    
    
    
    
    
}
