<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auto Partes</title>
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
                    <a class="nav-link" href="logout.jsp">salir</a>
                </li>
            </ul>
        </nav>

        <br>
<!-- contenido del body -->

        <div class="container" style="padding-top:25px;">



            <div class="card-columns">

                <a href="cliente.jsp" data-toggle="tooltip" title="Altas, bajas y cambios de clientes!">
                    <div class="card bg-primary">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Clientes</p>
                            <br>
                        </div>
                    </div>
                </a>

                <a href="rp_cliente.jsp" data-toggle="tooltip" title="Detalle de los clientes en el sistema">
                    <div class="card bg-danger">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Reporte Clientes</p>
                            <br>
                        </div>
                    </div>
                </a>

                <a href="producto.jsp" data-toggle="tooltip" title="Altas, bajas y cambios de Productos!">
                    <div class="card bg-warning">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Productos</p>
                            <br>
                        </div>
                    </div>
                </a>

                <a href="rp_producto.jsp" data-toggle="tooltip" title="Detalle de los productos en Stock!">
                    <div class="card bg-dark">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Reporte Productos</p>
                            <br>
                        </div>
                    </div>
                </a>



                <a href="orden.jsp" data-toggle="tooltip" title="Altas, bajas y cambios de Ordenes!">
                    <div class="card bg-success">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Ordenes</p>
                            <br>
                        </div>
                    </div>
                </a>





                <a href="rp_orden.jsp" data-toggle="tooltip" title="Obten un detalle de una orden numero de productos, cliente!">
                    <div class="card bg-info">
                        <div class="card-body text-center">
                            <br>
                            <p class="card-text">Reporte Ordenes</p>
                            <br>
                        </div>
                    </div>
                </a>





            </div>
        </div>
<!-- Fin contenido del body -->

    </body>
</html>
