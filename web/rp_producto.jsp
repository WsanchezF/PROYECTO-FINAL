<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Conexion"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes Productos</title>
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
        <div style="width:80%;margin: auto;" class="card-columns">

             <%
                            Conexion con = new Conexion();
                            ResultSet data = con.getTablaData("producto");
                        %>    
                    <div class="card bg-primary">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Total Productos</p>
                            <h2><%= con.contarRegistro("producto", "codigo") %></h2>
                            <br>
                        </div>
                    </div>
                            
                     <div class="card bg-danger">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Total Marcas</p>
                            <h2><%= con.diferente("marca", "producto") %></h2>
                            <br>
                        </div>
                    </div>
                

            

                
        </div>

        <div class="container">


            <br>
            <br>
            <br>
            <div class="container">
                         
                <table class="table table-hover">
                    <thead>
                       
                        <tr>
                            <th>Id</th>
                            <th>producto</th>
                            <th>precio unidad</th>
                            <th>marca</th>
                    </thead>
                    <tbody>

                        <% while (data.next()) {%>

                        <tr>

                            <td><%= data.getString(1)%></td>
                            <td><%= data.getString(2)%></td>
                            <td><%= data.getString(3)%></td>
                            <td><%= data.getString(4)%></td>


                        </tr>

                        <% }%>

                    </tbody>
                </table>
            </div>


        </div>
    </body>
</html>
