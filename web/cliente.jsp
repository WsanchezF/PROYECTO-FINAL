<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Conexion"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestiones Cliente</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            a{
                text-decoration: none;
                color:white;
            }
            a:hover {
                text-decoration: none;
                color:black;
            }
        </style>
    </head>
    <body>
         <%
            
            try{
                
                if(request.getParameter("msg")!=null)
                { %>
                      <div style="margin:0;" class="alert alert-info alert-dismissible">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <strong>Info!</strong> <%= request.getParameter("msg") %>
  </div>
  <%
                }
                
            }catch(Exception e)
            {
                
            }
            
            %>
        <%
            //validar si la sesion se ha iniciado con el objeto USUARIO
            //de no haber iniciado se redirijira a la pagina de LOG IN
            Usuario temp = null;
            if (request.getSession().getAttribute("usuario_uso") == null) {
                response.sendRedirect("index.jsp?msg='invalido'");
            } else {
                temp = (Usuario) request.getSession().getAttribute("usuario_uso");
            }
        %>


        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link">Auto Partes</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link">Usuario: <%= temp.getUsuario()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link">Nombre: <%= temp.getNombre()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="menu.jsp">Regresar</a>
                </li>
            </ul>
        </nav>

        <br>
        
        <div class="container">
 
  <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#form_individual">Agregar Individual</button>
  <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#form_empresa">Agregar Empresarial</button>
  <div id="form_individual" class="collapse">
      <br>
  <form action="Crud" method="post">
      
    <div class="form-group">
      <label>Nombre:</label>
      <input type="text" class="form-control" name="nombre">
    </div>
      
    <div class="form-group">
      <label>Apellido:</label>
      <input type="text" class="form-control" name="apellido">
    </div>
      
        <div class="form-group">
      <label>Dpi:</label>
      <input type="text" class="form-control" name="dpi">
    </div>
    
      <div class="form-group">
      <label>Nit:</label>
      <input type="text" class="form-control" name="nit">
    </div>
      
     <input type="hidden" name="make" value="crear"/>
      
      
    
    
    <button type="submit" class="btn btn-primary">Guardar</button>
  </form>
  </div>
  <div id="form_empresa" class="collapse">
      <form action="Crud" method="post">
      
    <div class="form-group">
      <label>Nombre:</label>
      <input type="text" class="form-control" name="nombre">
    </div>

      <div class="form-group">
      <label>Nit:</label>
      <input type="text" class="form-control" name="nit">
    </div>
          
            <div class="form-group">
      <label>Contacto:</label>
      <input type="text" class="form-control" name="contacto">
    </div>
          
          
          <div class="form-group">
      <label>Descuento:</label>
      <input type="text" class="form-control" name="descuento">
    </div>
      
     <input type="hidden" name="make" value="crearE"/>
      
      
    
    
    <button type="submit" class="btn btn-primary">Guardar</button>
  </form>
  </div>
  
  <br>
  <br>
  <br>
  <div class="container">
  <h2>Clientes</h2>          
  <table class="table table-hover">
    <thead>
        <%
          Conexion con = new Conexion();
          ResultSet clientes = con.getTablaData("cliente");
            %>
      <tr>
        <th>Id</th>
        <th>nombre</th>
        <th>apellido</th>
        <th>nit</th>
        <th>tipo</th>
        <th>    </th>
        
    </thead>
    <tbody>
        
        <% while(clientes.next()){%>
        
      <tr>
          <td><%= clientes.getString(1) %></td>
          <td><%= clientes.getString(2) %></td>
          <td><%= clientes.getString(3) %></td>
          <td><%= clientes.getString(4) %></td>
          <td><%= clientes.getString(5) %></td>
          
          <td><form action="Crud" method="post"><input type="hidden" name="make" value="borrar"/><input type="hidden" name="id_borrar" value="<%= clientes.getString(1) %>"/><input type="submit" class="btn" value="borrar"></button></form></td>
          
        
      </tr>
      
      <% } %>
      
    </tbody>
  </table>
</div>
  
  
</div>

        

    </body>
</html>
