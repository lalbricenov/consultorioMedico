/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

/**
 *
 * @author lalbr
 */
public class Usuario {
     // Configuracion de la conexion a la base de datos 
    private String id_usuario;
    private String correo;
    private String num_telefono;
    private String password;
    private boolean correo_verificado;
    private String nombres;
    private String apellidos;
    //Constructor sin parmetros		

    public Usuario() {
        this.correo_verificado = false;
    }
    public Usuario(String id, String correo, String numTel, String pass, boolean corrVerif, String nombres, String apellidos) {
        setId_usuario(id);
        setCorreo(correo);
        setNum_telefono(numTel);
        setPassword(pass);
        setCorreo_verificado(corrVerif);
        setNombres(nombres);
        setApellidos(apellidos);
    }
    
    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNum_telefono() {
        return num_telefono;
    }

    public void setNum_telefono(String num_telefono) {
        this.num_telefono = num_telefono;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isCorreo_verificado() {
        return correo_verificado;
    }

    public void setCorreo_verificado(boolean correo_verificado) {
        this.correo_verificado = correo_verificado;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public String userString(){
        return this.getApellidos();
    }
}
