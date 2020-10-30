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
 
  <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#pro">Agregar</button>
  
  <div id="pro" class="collapse">
      <br>
  <form action="Crud" method="post">
      
    <div class="form-group">
      <label>producto:</label>
      <input type="text" class="form-control" name="producto">
    </div>
      
    <div class="form-group">
      <label>Precio Unidad:</label>
      <input type="text" class="form-control" name="precio">
    </div>
      
      
      <div class="form-group">
      <label>Marca:</label>
      <input type="text" class="form-control" name="marca">
    </div>
      
     <input type="hidden" name="make" value="crear_producto"/>
      
      
    
    
    <button type="submit" class="btn btn-primary">Guardar</button>
  </form>
  </div>

  
  <br>
  <br>
  <br>
  <div class="container">
  <h2>Productos</h2>          
  <table class="table table-hover">
    <thead>
        <%
          Conexion con = new Conexion();
          ResultSet data = con.getTablaData("producto");
            %>
      <tr>
        <th>Id</th>
        <th>producto</th>
        <th>precio unidad</th>
        <th>marca</th>
        <th>    </th>
        <th>    </th>
    </thead>
    <tbody>
        
        <% while(data.next()){%>
        
      <tr>
    
          <td><%= data.getString(1) %></td>
    <form action="Crud" method="post">
        <input type="hidden" name="id" value="<%= data.getString(1) %>"/>
          <td><input type="text" name="producto" value="<%= data.getString(2) %>"/></td>
          <td><input type="text" name="precio" value="<%= data.getString(3) %>"/></td>
          <td><input type="text" name="marca" value="<%= data.getString(4) %>"/></td>
          <input type="hidden" name="make" value="update_p"/>
          <td><input type="submit" class="btn" value="actualizar"/></td>
    </form>
          <td><form action="Crud" method="post"><input type="hidden" name="make" value="borrar_p"/><input type="hidden" name="id_borrar" value="<%= data.getString(1) %>"/><input type="submit" class="btn" value="borrar"></form></td>
          
        
      </tr>
      
      <% } %>
      
    </tbody>
  </table>
</div>
  
  
</div>

        

    </body>
</html>
