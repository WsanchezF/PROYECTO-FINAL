<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.Conexion"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orden Compra</title>
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
                 //con.getTablaData("cliente");
                 ResultSet data = con.getTablaData("orden");
                 String cliente_id="";
            %>
       
        <div style="padding-top:50px;" class="container">
            <form action="ControlOrden" method="get">
                <div class="form-group">
                    <label for="sel1">Selecciona el numero de Orden:</label>
                    <select class="form-control" name="orden">
                        <option></option>
                        <% while (data.next()) { cliente_id = data.getString(2);%>
                        <option value="<%= data.getString(1)%>"><%= "No# Orden: " + data.getString(1) %></option>
                        <% }%>
                    </select>
                </div>
                        <input type="hidden" name="cliente_id" value="<%= cliente_id %>"/>
                    <input type="hidden" name="option" value="detalle"/>
                <button type="submit" class="btn btn-primary">ver detalle</button>
            </form>
        </div>
                    
                   
                    
    </body>
</html>
