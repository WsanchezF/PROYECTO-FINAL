/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 * clase enpresa hereda de cliente
 * @author q669YS4G
 */

//clase Empresa hereda de la clase cliente
public class Empresa extends Cliente{
    
    private String contacto;
    private int descuento;
/**
 * constructor empresa recive contacto y descuento
 * @param contacto contacto
 * @param descuento  contacto
 */
   
/**
 * constructo empresa recive contacto, descuento, nombre, apellido, tipo por parametros
 * @param contacto contact
 * @param descuento string
 * @param nombre string
 * @param apellido string
 * @param tipo string
 */
    public Empresa(int id,String contacto, int descuento, String nombre, String apellido,String  nit, String tipo) {
        super(id,nombre, apellido, nit, tipo);
        this.contacto = contacto;
        this.descuento = descuento;
    }
/**
 * metodo getContacto devuleve el valor contacto
 * @return string
 */
    public String getContacto() {
        return contacto;
    }
    
  /**
   * asigna el valor de contacto
   * @param contacto  string
   */

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }
/**
 * devuelve el valor de descuento int
 * @return int
 */
    public int getDescuento() {
        return descuento;
    }
    /**
     * recive el valor de descuento por parametro
     * @param descuento string
     */

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }
    
    /**
     * metodo to string sobre escrito
     * @return string
     */

    @Override
    public String toString() {
        return "Empresa{" + "contacto=" + contacto + ", descuento=" + descuento + '}';
    }
    
    
    
    
    
}
