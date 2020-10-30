package modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlOrden extends HttpServlet {

    private String cliente;
    private String opcion;
    private Conexion cn;
    private String numeroOrden;

    private String cantidad;
    private String id_producto;
    private String nombre_producto;
    private String precio;
    private String id_orden;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControlOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlOrden at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        numeroOrden = request.getParameter("orden");
        cliente = request.getParameter("cliente_id");

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int descuento=0;
            cn = new Conexion();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>detalles de orden</title>");
            out.println("<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>");
            out.println("</head>");
            out.println("<body style='width:60%; margin:auto;'>");
            out.println("<hr/>");
            out.println("<h1 style='text-align:center;'> Orden# " + numeroOrden + "</h1>");

            ResultSet clienteinfo = cn.getTablaData("cliente WHERE id=" + cliente + "");

            while (clienteinfo.next()) {

                out.print("<p>Nombre: " + clienteinfo.getString(2) + "</p>");
                //out.print("<p>"+clienteinfo.getString(3)+"</p>");
                out.print("<p>Nit: " + clienteinfo.getString(4) + "</p>");
                out.print("<p>Tipo: " + clienteinfo.getString(5) + "</p>");
                if(clienteinfo.getString(8)!=null){
                descuento=Integer.parseInt(clienteinfo.getString(8));
                }
            }
            out.println("<hr/>");

            ResultSet articulos = cn.getTablaData("detalle WHERE orden_id=" + numeroOrden + "");
            out.println("<div class=\"container\">");
            out.println("<table class=\"table\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>No.</th>");
            out.println("<th>Producto</th>");
            out.println("<th>Precio Unidad</th>");
            out.println("<th>Cantidad</th>");
            out.println("<th>Sub total</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            int contador = 1;
            while (articulos.next()) {

               
                out.println("<tr>");
                out.println("<td>"+contador+"</td>");
                out.println("<td>"+articulos.getString(3)+"</td>");
                out.println("<td>Q "+articulos.getString(4)+".00</td>");
                out.println("<td>"+articulos.getString(5)+"</td>");
                out.println("<td>Q "+articulos.getString(6)+".00</td>");
                out.println("</tr>");
                contador++;

            }

            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
             out.println("<hr/>");
             int totalFactura = cn.sumar("total", "detalle WHERE orden_id="+numeroOrden+"");
             int neto=(totalFactura*descuento)/100;
             if(descuento>0)
             {
                 out.println("<h3> Descuento: Q "+neto+".00</h3>");
                 out.println("<h2> Total: Q "+ (totalFactura-neto) +".00</h2>");
             }else{
                 out.println("<h2> Total: Q "+totalFactura+".00</h2>");
             }
            
            
            out.println("<hr/>");
            out.println("<div class=\"alert alert-success\">");
  out.println("<strong>Consultar otra orden!</strong> <a href='rp_orden.jsp'>consultar ahora</a>");
out.println("</div>");
           

            out.println("</body>");
            out.println("</html>");
        } catch (Exception e) {
            response.sendRedirect("orden.jsp?msg='Estamos Trabajando para resolver los incovenientes :)'");
        } finally {
            cn = null;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //processRequest(request, response);
            opcion = request.getParameter("option");

            cn = new Conexion();
            switch (opcion) {
                case "crear":
                    if (request.getParameter("cliente") != null) {
                        cliente = request.getParameter("cliente");
                        Orden temp = new Orden();
                        temp.setId("0");
                        temp.setCliente(cliente);
                        cn.agregar(temp);
                        response.sendRedirect("agregar_item.jsp?msg='La orden para el cliente id: " + cliente + " se ha generado :)'&cliente=" + cliente + "");
                    } else {
                        response.sendRedirect("orden.jsp?msg='Por favor seleciona un cliente para crear una orden! :)'");
                    }
                    break;
                case "borrar":
                    numeroOrden = request.getParameter("orden");
                    cn.borrar(numeroOrden, true);
                    response.sendRedirect("orden.jsp?msg='El numero de orden: " + numeroOrden + " se ha eliminado :)'");

                    break;
                case "agregar_art":

                    cantidad = request.getParameter("cantidad");
                    id_producto = request.getParameter("id_producto");
                    nombre_producto = request.getParameter("nombre_producto");
                    precio = request.getParameter("precio");
                    id_orden = request.getParameter("id_orden");
                    
                    cliente = request.getParameter("cliente");
                    
                    cn.agregar(new Articulo(id_orden,id_producto,nombre_producto,precio,cantidad));
                    response.sendRedirect("agregar_item.jsp?cliente="+cliente+"&"+"msg=has agregado " + cantidad + " uni de "+nombre_producto+" a la Orden"+id_orden);

                    break;
                

            }

        } catch (Exception ex) {

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
