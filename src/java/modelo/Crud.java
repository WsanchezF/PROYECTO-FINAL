
package modelo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Crud extends HttpServlet {

  private String action;
  private Conexion con;
 private String id_borrar;
 private String id;
 
 private String nombreInd;
 private String apellidoInd;
 private String dpiInd;
 private String nitInd;
 
 private String contacto;
 private String descuento;
 
 private String nomProducto;
 private String precioProducto;
 private String marcaProducto;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        action=request.getParameter("make");
        id_borrar=request.getParameter("id_borrar");
        try{
        con = new Conexion();
        
          if(action.equals("borrar"))
        {
            con.borrar(id_borrar);
            
            response.sendRedirect("cliente.jsp?msg='el cliente ha sido borrado :('");
        }else if(action.equals("crear")){
            
            
  nombreInd =request.getParameter("nombre");
 apellidoInd=request.getParameter("apellido");
 dpiInd=request.getParameter("dpi");
 nitInd=request.getParameter("nit");
    
            
            con.agregar(new Individual(0,dpiInd,nombreInd,apellidoInd,nitInd,"Individual"));
            response.sendRedirect("cliente.jsp?msg='cliente agregado con exito :)'");
        }else if(action.equals("crearE")){
            
            
             nombreInd =request.getParameter("nombre");
             nitInd=request.getParameter("nit");
             contacto =request.getParameter("contacto");
             descuento =request.getParameter("descuento");
             con.agregar(new Empresa(0,contacto,Integer.parseInt(descuento),nombreInd,"n/a",nitInd,"Empresarial"));
            response.sendRedirect("cliente.jsp?msg='cliente Empresarial agregado con exito :)'");
            
        }else if(action.equals("crear_producto")){
            
            
            nomProducto=request.getParameter("producto");
            precioProducto=request.getParameter("precio");
            marcaProducto=request.getParameter("marca");
            con.agregar(new Producto(nomProducto,precioProducto,marcaProducto));
            response.sendRedirect("producto.jsp?msg='Producto: "+nomProducto+" agregado con exito :)'");
        }else if(action.equals("borrar_p"))
        {
            con.borrar(id_borrar,"producto");
            
            response.sendRedirect("producto.jsp?msg='Producto ha sido dado de baja :('");
        }else if(action.equals("update_p")){
            
            id=request.getParameter("id");
            nomProducto=request.getParameter("producto");
            precioProducto=request.getParameter("precio");
            marcaProducto=request.getParameter("marca");
            con.update(new Producto(nomProducto,precioProducto,marcaProducto), id);
            response.sendRedirect("producto.jsp?msg='Producto ha sido actualizado :)'");
        }
          
        
        
        }catch(Exception e){
            response.sendRedirect(e.getMessage());
            
        }
        
      
        
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
