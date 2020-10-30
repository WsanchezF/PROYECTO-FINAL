<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Conexion"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Articulo</title>
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

            try {

                if (request.getParameter("msg") != null) {%>
        <div style="margin:0;" class="alert alert-info alert-dismissible">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Info!</strong> <%= request.getParameter("msg")%>
        </div>
        <%
                }

            } catch (Exception e) {

            }

        %>
        <%            //validar si la sesion se ha iniciado con el objeto USUARIO
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
  <%
                Conexion con = new Conexion();
                int tempID = Integer.parseInt(request.getParameter("cliente"));
                ResultSet data = con.getTablaData("orden WHERE id_cliente="+tempID+"");
                
                //out.print("<h1>"+tempID+"</h1>");
                
String numeroOrden="";
String clieneId="";
            %>
            
         <% while (data.next()) {
                        
            numeroOrden=data.getString(1); 
            clieneId=data.getString(2);
                        
           }%>    
        <div style="padding-top:50px;" class="container">
            <div class="form-group">
                <label for="orden">Numero de Orden#: <%= numeroOrden %></label>
                <label for="cliente">Id Cliente: <%= clieneId %></label>  
                        
            </div>
            
            
                <% data = con.getTablaData("producto"); %>
                <table class="table table-hover">
                    <thead>
                       
                        <tr>
                            <th>Id</th>
                            <th>producto</th>
                            <th>precio unidad</th>
                            <th>marca</th>
                            <th>cantidad</th>
                            <th>+</th>
                    </thead>
                    <tbody>

                        <% while (data.next()) {%>
                        <form action="ControlOrden" method="post"> 
                        <tr>    
                            <td><%= data.getString(1)%></td>
                            <td><%= data.getString(2)%></td>
                            <td><%= data.getString(3)%></td>
                            <td><%= data.getString(4)%></td>
                            <td><input type="text" name="cantidad" value="1"/></td>
                            <input type="hidden" name="id_producto" value="<%= data.getString(1)%>"/>
                            <input type="hidden" name="nombre_producto" value="<%= data.getString(2)%>"/>
                            <input type="hidden" name="precio" value="<%= data.getString(3)%>"/>
                            <input type="hidden" name="id_orden" value="<%= numeroOrden %>"/>
                            <input type="hidden" name="cliente" value="<%= clieneId %>"/>
                            <input type="hidden" name="option" value="agregar_art"/>
                            <td><input type="submit" value="agregar"/></td>
                        </tr>
                        </form>

                        <% }%>

                        </tbody>
                </table>
                <div class="alert alert-success">
                    <strong>has click para terminar la orden</strong> <a href="rp_orden.jsp">Terminar</a>
                </div>
        </div>            
    </body>
</html>
