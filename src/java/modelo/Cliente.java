
package modelo;


/**
 * Clase Cliente clase padre para otras clases tipo cliente como (Individual Empresa)
 * @author q669YS4G
 */
//clase cliente super clase de Individual y Empresa (estos son tipos de clientes)
public class Cliente {
    
    
    private int id;
    private String nombre;
    private String apellido;
    private String nit;
    private String tipo;

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }
    
    
    
    /**
     * constructor recive parametros para darle un valor inicial al objeto
     * @param nombre nombre
     * @param apellido apellido
     * @param tipo  tipo
     */
    public Cliente(int id, String nombre, String apellido, String nit, String tipo) {   
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.nit = nit;
        this.tipo = tipo;
    }

/**
     * metodo get devuleve el valor del id asignado
     * @return entero
     */
    public int getId() {
        return id;
    }
    
    /**
     * metodo set id fija un id del tipo entero de ser necesario
     * @param id int
     */

    public void setId(int id) {
        this.id = id;
    }

   
    /**
     * metodo getNombre devuleve string
     * @return string
     */
    public String getNombre() {
        return nombre;
    }
    
    /**
     * metodo setNombre recive un string como nombre
     * @param nombre string
     */

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    /**
     * metoto getApellido devuleve el valor del apellido
     * @return string
     */

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    /**
     * metoto getTipo Devuelve el tipo
     * @return string
     */

    public String getTipo() {
        return tipo;
    }
    /**
     * fija el valor de del tip
     * @param tipo int
     */

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    /**
     * meoto toString sobre escribido devuleve informacion del objeto
     * @return int
     */

   
    
    
}
