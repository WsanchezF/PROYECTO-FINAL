
package modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogIn extends HttpServlet {
    
    
    private String usuario;
    private String pass;

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter(); 
            Conexion con = null;
            usuario=request.getParameter("usuario");
            pass=request.getParameter("pswd");
            
        try {
            con = new Conexion();
            Usuario temp = con.validarUsuario(usuario, pass);
             out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogIn</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Validando</h1>");
            out.println("</body>");
            out.println("</html>");
            
            if(temp.getNombre()!=null)
            {
                  HttpSession session=request.getSession();  
                  session.setAttribute("usuario_uso",temp);  
                response.sendRedirect("menu.jsp");
            }
            else
            {
                response.sendRedirect("index.jsp?msg='valla no hemos encontrado tu usuario, valida tus credenciales y intenta de nuevo'");
            }
            
            
            
            
        } catch (Exception e) {
            
            out.print(e.getMessage());
        }
            
            
            
           
           
            
        
        
       
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
